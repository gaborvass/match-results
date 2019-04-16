//
//  OrganizationsModel.swift
//  match-results-ios
//
//  Created by Vass Gábor on 12/04/2019.
//  Copyright © 2019 gabor.vass. All rights reserved.
//

import Foundation
import match_results_common

class FederationsModel : BaseModel<Void, String> {
    
}

extension FederationsModel : ModelProtocol {
    func convert(_ raw: String) -> [String] {
        return ["hello"]
    }
    
    typealias Input = Void
    typealias Output = [String]

}
