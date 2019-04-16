//
//  RouterProtocol.swift
//  match-results-ios
//
//  Created by Vass Gábor on 12/04/2019.
//  Copyright © 2019 gabor.vass. All rights reserved.
//

import Foundation
import UIKit

enum RouteResult {
    case FederationSelected(String)
    case LeagueSelected(String)
}

enum Routes {
    case Federations
    case Leagues
}

protocol RouterProtocol where Self : UIViewController {
    
    func setup()
    func enter(_ input: String, onExit: @escaping (RouteResult) -> Void)

}
