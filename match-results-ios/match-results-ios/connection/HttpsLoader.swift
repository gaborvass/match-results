//
//  HttpsLoader.swift
//  match-results-ios
//
//  Created by Vass Gábor on 12/04/2019.
//  Copyright © 2019 gabor.vass. All rights reserved.
//

import Foundation

class HttpsLoader {
    
    func load(then: @escaping (Result<String>) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.0, execute:{then(.Success("done"))})
    }
    
}
