//
//  ViewControllerProtocol.swift
//  match-results-ios
//
//  Created by Vass Gábor on 12/04/2019.
//  Copyright © 2019 gabor.vass. All rights reserved.
//

import Foundation
import UIKit

protocol ViewControllerDelegate {
    
    func onActionExecuted()
    
}

protocol ViewControllerProtocol  where Self : UIViewController {
    
    func start(_ initialInput: String)
}
