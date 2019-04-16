//
//  DataManager.swift
//  backend
//
//  Created by Vass Gábor on 13/08/2017.
//
//

import Foundation
import Vapor

class DataManager {
    
    let dataParserImpl : DataParserProtocol
    let dataLoaderImpl : DataLoaderProtocol
    
    init(dataLoader: DataLoaderProtocol, dataParser: DataParserProtocol) {
        dataLoaderImpl = dataLoader
        dataParserImpl = dataParser
    }
    
    func getFederations(in container: Container) throws -> Future<[FederationObject]> {
        return try dataLoaderImpl.loadRawBasicData(in: container).map({ rawResponse in
            return try self.dataParserImpl.parseFederations(rawResponse)
        })
    }
    
    func getSeasons(in container: Container) throws -> Future<[SeasonObject]> {
        return try dataLoaderImpl.loadRawBasicData(in: container).map({ rawResponse in
            return try self.dataParserImpl.parseSeasons(rawResponse)
        })
    }
    
    func getBasicData(in container: Container) throws -> Future<BasicDataObject> {
        return try dataLoaderImpl.loadRawBasicData(in: container).map({ rawResponse in
            let federations = try self.dataParserImpl.parseFederations(rawResponse)
            let seasons = try self.dataParserImpl.parseSeasons(rawResponse)
            return BasicDataObject(federations: federations, seasons: seasons)
        })
    }
    
    func getLeagues(in container: Container, seasonId: String, federationId: String) throws -> Future<[LeagueObject]> {
        return try dataLoaderImpl.loadRawLeagues(in: container, seasonId: seasonId, federationId: federationId).map({ rawResponse in
            return try self.dataParserImpl.parseLeagues(rawResponse)
        })
    }

    func getRounds(in container: Container, seasonId: String, federationId: String, leagueId: String) throws -> Future<[RoundObject]> {
        return try dataLoaderImpl.loadRawRounds(in: container, seasonId: seasonId, federationId: federationId, leagueId: leagueId).map({ rawResponse in
            return try self.dataParserImpl.parseRounds(rawResponse)
        })
    }

    func getLeagueDetails(in container: Container, seasonId: String, federationId: String, leagueId: String, roundId: String) throws -> Future<LeagueDetailsObject> {
        return try dataLoaderImpl.loadRawLeagueDetails(in: container, seasonId: seasonId, federationId: federationId, leagueId: leagueId, roundId:  roundId).map({ rawResponse in
            let matches = try self.dataParserImpl.parseMatches(rawResponse)
            let teams = try self.dataParserImpl.parseTeams(rawResponse)
            return LeagueDetailsObject(matches: matches, teams: teams)
        })
    }

}
