//
//  BasicDataObject.swift
//  App
//
//  Created by Vass Gábor on 15/02/2019.
//

import Foundation
import Vapor

struct BasicDataObject : Codable {
    let federations: [FederationObject]
    let seasons: [SeasonObject]
}

extension BasicDataObject : Content {
    
}
