//
//  OrganizationsViewController.swift
//  match-results-ios
//
//  Created by Vass Gábor on 12/04/2019.
//  Copyright © 2019 gabor.vass. All rights reserved.
//

import UIKit

class FederationsViewController: UIViewController {

    var _label : UILabel?
    
    var _model : FederationsModel?
    var _onExit : ((RouteResult) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        
    }
    
}

extension FederationsViewController : RouterProtocol {

    func setup() {
        _model = FederationsModel()
        _label = UILabel.init(frame: CGRect(x: 100, y: 150, width: 100, height: 20))
        view.addSubview(_label!)
        setupCallbacks()
    }
    
    // FIXME: move generic callbacks to base class
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
            
            self._onExit?(.FederationSelected("bye"))
        }
    }
    
    func enter(_ input: String, onExit: @escaping (RouteResult) -> Void) {
        _model?.load(())
        _onExit = onExit
    }
    
}
