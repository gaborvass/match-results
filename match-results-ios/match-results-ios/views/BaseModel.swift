//
//  BaseModel.swift
//  match-results-ios
//
//  Created by Vass Gábor on 12/04/2019.
//  Copyright © 2019 gabor.vass. All rights reserved.
//

import Foundation

enum State {
    case Idle
    case Loading
    case Success
    case Error
}

//FIXME: too long

class BaseModel<Input, Output> {
    
    var onIdle : (() -> Void)?
    var onLoading : (() -> Void)?
    var onSuccess : (() -> Void)?
    var onError : (() -> Void)?
    
    var state : State = .Idle {
        willSet(newValue) {
            print("changing model state [\(state)] -> [\(newValue)]")
        }
        didSet {
            onStateChanged()
        }
    }

    var _data : Output?

    let _connection : HttpsLoader = HttpsLoader()

    func onStateChanged() {
        switch state {
        case .Loading:
            if (onLoading != nil) {
                invokeOnMainThread(onLoading!)
            }
        case .Success:
            if (onSuccess != nil) {
                invokeOnMainThread(onSuccess!)
            }
            state = .Idle
        case .Error:
            if (onError != nil) {
                invokeOnMainThread(onError!)
            }
            state = .Idle
        default:
            invokeOnMainThread(onIdle!)
        }
    }
    
    func invokeOnMainThread(_ closure: @escaping (() -> Void)) {
        DispatchQueue.main.async {
            closure()
        }
    }
    
    func load(_ input: Input) {
        state = .Loading
        _connection.load { (result : Result<String>) in
            switch result {
            case .Success(_):
                self.state = .Success
            case .Error(_):
                self.state = .Error
            }
        }
    }
    

    
}

