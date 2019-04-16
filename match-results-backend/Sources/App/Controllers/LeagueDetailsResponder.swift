//
//  LeagueDetailsResponder.swift
//  App
//
//  Created by Vass Gábor on 15/04/2019.
//

import Vapor

final class LeagueDetailsResponder {
    
    let dm : DataManager
    
    init(_ dataManager : DataManager) {
        dm = dataManager
    }
    
    func respond(_ request: Request) throws -> Future<Response> {
        let seasonId = try request.parameters.next(String.self)
        let federationId = try request.parameters.next(String.self)
        let leagueId = try request.parameters.next(String.self)
        let roundId = try request.parameters.next(String.self)
        return try dm.getLeagueDetails(in: request, seasonId: seasonId, federationId: federationId, leagueId: leagueId, roundId: roundId).encode(for: request)
    }

    
}
