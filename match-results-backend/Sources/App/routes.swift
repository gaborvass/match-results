import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {

    let dataManager = DataManager(dataLoader: DefaultDataLoader(), dataParser: DefaultDataParser())
    
    let basicDataResponder = BasicDataResponder(dataManager)
    let federationsResponder = FederationsResponder(dataManager)
    let seasonsResponder = SeasonsResponder(dataManager)
    let leaguesResponder = LeaguesResponder(dataManager)
    let roundsResponder = RoundsResponder(dataManager)
    let leagueDetailsResponder = LeagueDetailsResponder(dataManager)
    
    // API Routes
    router.get("basic_data", use: basicDataResponder.respond)
    router.get("federations", use: federationsResponder.respond)
    router.get("seasons", use: seasonsResponder.respond)
    router.get("leagues",String.parameter,String.parameter, use: leaguesResponder.respond)
    router.get("rounds",String.parameter,String.parameter,String.parameter, use: roundsResponder.respond)
    router.get("league_details",String.parameter,String.parameter,String.parameter,String.parameter, use: leagueDetailsResponder.respond)
    
    // Web routes
    router.get("web/basicData", use: basicDataResponder.render)
    router.get("web/federations", use: federationsResponder.render)
    router.get("web/leagues", String.parameter,String.parameter, use: leaguesResponder.render)

}
