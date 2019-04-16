//
//  GetRoundsResponder.swift
//  backend
//
//  Created by Vass Gábor on 25/08/2017.
//
//

import Vapor

final class RoundsResponder {
 
    let dm : DataManager
    
    init(_ dataManager : DataManager) {
        dm = dataManager
    }
    
    func respond(_ request: Request) throws -> Future<Response> {
        let seasonId = try request.parameters.next(String.self)
        let federationId = try request.parameters.next(String.self)
        let leagueId = try request.parameters.next(String.self)
        return try self.dm.getRounds(in: request, seasonId: seasonId, federationId: federationId, leagueId: leagueId).encode(for: request)
    }
    
}
