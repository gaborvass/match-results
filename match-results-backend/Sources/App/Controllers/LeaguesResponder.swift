//
//  GetLeaguesResponder.swift
//  backend
//
//  Created by Vass Gábor on 25/08/2017.
//
//

import Vapor

final class LeaguesResponder {

    let dm : DataManager
    
    init(_ dataManager : DataManager) {
        dm = dataManager
    }
    
    func respond(_ request: Request) throws -> Future<Response> {
        let seasonId = try request.parameters.next(String.self)
        let federationId = try request.parameters.next(String.self)
        return try self.dm.getLeagues(in: request, seasonId: seasonId, federationId: federationId).encode(for: request)
    }

    func render(_ request: Request) throws -> Future<View> {
        let seasonId = try request.parameters.next(String.self)
        let federationId = try request.parameters.next(String.self)
        return try self.dm.getLeagues(in: request, seasonId: seasonId, federationId: federationId).flatMap({ (leagues: [LeagueObject]) -> EventLoopFuture<View> in
            return try request.view().render("leagues", ["leagues": leagues])
        })
    }

    
}

