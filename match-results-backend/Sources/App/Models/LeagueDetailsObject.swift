//
//  LeagueDetailObject.swift
//  App
//
//  Created by Vass Gábor on 15/04/2019.
//

import Foundation
import Vapor

struct LeagueDetailsObject : Codable {
    
    let matches : [MatchObject]
    let teams : [TeamObject]
    
}

extension LeagueDetailsObject : Content {
    
}
