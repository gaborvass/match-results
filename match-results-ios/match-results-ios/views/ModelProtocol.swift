//
//  ModelProtocol.swift
//  match-results-ios
//
//  Created by Vass Gábor on 12/04/2019.
//  Copyright © 2019 gabor.vass. All rights reserved.
//

import Foundation

protocol ModelProtocol {
    
    associatedtype Input
    associatedtype Output
    
    func load(_ input: Input)
    
}
