//
//  Router.swift
//  match-results-ios
//
//  Created by Vass Gábor on 12/04/2019.
//  Copyright © 2019 gabor.vass. All rights reserved.
//

import Foundation
import UIKit

class Router {
    
    let _navigationController : UINavigationController
    
    var _routes : [Routes : RouterProtocol] = [:]
    
    init() {
        _navigationController = UINavigationController()
    }
    
    func viewController() -> UIViewController {
        return _navigationController
    }
    
    func enter(_ route: Routes, input: String) {
        let exitHandler : ((RouteResult) -> Void) = { viewResult in
            switch viewResult {
            case .FederationSelected(let selectedFederation):
                self.enter(.Leagues, input: selectedFederation)
            case .LeagueSelected(let selectedLeague):
                self.enter(.Leagues, input: selectedLeague)
            }
        }

        let vc = _routes[route]!
        // FIXME: clean somehow
        vc.enter(input, onExit: exitHandler)
        _navigationController.pushViewController(vc, animated: true)
    }
    
    func setup() {

        let federationsView = FederationsViewController()
        federationsView.setup()

        let leaguesView = LeaguesViewController()
        leaguesView.setup()
        
        _routes = [.Federations: federationsView, .Leagues: leaguesView]

        self.enter(.Federations, input: "")
    }
    
    
}
