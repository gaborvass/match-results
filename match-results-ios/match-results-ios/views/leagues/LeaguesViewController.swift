//
//  LeaguesViewController.swift
//  match-results-ios
//
//  Created by Vass Gábor on 12/04/2019.
//  Copyright © 2019 gabor.vass. All rights reserved.
//

import Foundation
import UIKit

class LeaguesViewController : UIViewController {
    var _label : UILabel?
    
    var _model : LeaguesModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.green
    }
}

extension LeaguesViewController : RouterProtocol {
    
    typealias Input = String
    typealias Output = String
    
    func setup() {
        _model = LeaguesModel()
        _label = UILabel.init(frame: CGRect(x: 100, y: 150, width: 100, height: 20))
        view.addSubview(_label!)
        setupCallbacks()
    }
    
    private func setupCallbacks() {
        _model?.onIdle = {
            self._label?.text = "Idle"
        }
        _model?.onError = {
            self._label?.text = "Error"
        }
        _model?.onLoading = {
            self._label?.text = "Loading"
        }
        _model?.onSuccess = {
            self._label?.text = "Success"
        }
    }
    
    func enter(_ input: String, onExit: @escaping (RouteResult) -> Void) {
        _model?.load(input)
    }
    
}
