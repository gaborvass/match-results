//
//  GetBasicDataResponder.swift
//  backend
//
//  Created by Vass Gábor on 25/08/2017.
//
//

import Vapor

final class BasicDataResponder {
    
    let dm : DataManager
    
    init(_ dataManager : DataManager) {
        dm = dataManager
    }
    
    func respond(_ request: Request) throws -> Future<Response> {
        return try self.dm.getBasicData(in: request).encode(for: request)
    }
    
    func render(_ request: Request) throws -> Future<View> {
        return try self.dm.getBasicData(in: request).flatMap({ (result: BasicDataObject) -> EventLoopFuture<View> in
            return try request.view().render("basicData", result)
        })
    }

}
