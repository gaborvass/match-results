//
//  LeagueObject.swift
//  backend
//
//  Created by Vass Gábor on 13/08/2017.
//
//

import Foundation
import Vapor

struct LeagueObject : Codable {

    let leagueId: String
    let leagueName: String
    
}

extension LeagueObject : Content {
    
}
