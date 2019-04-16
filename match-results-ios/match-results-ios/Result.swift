//
//  Result.swift
//  match-results-ios
//
//  Created by Vass Gábor on 12/04/2019.
//  Copyright © 2019 gabor.vass. All rights reserved.
//

import Foundation

enum Result<Object> {
    case Success(Object)
    case Error(LoaderError)
}
