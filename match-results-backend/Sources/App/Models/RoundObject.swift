//
//  RoundObject.swift
//  Adatbank
//
//  Created by Vass Gábor on 29/01/16.
//  Copyright © 2016 Gabor, Vass. All rights reserved.
//

import Foundation
import Vapor

struct RoundObject : Codable {
    
    let roundId : String
    let roundName : String
    var isCurrent : Bool?
    
}

extension RoundObject : Content {
    
}
