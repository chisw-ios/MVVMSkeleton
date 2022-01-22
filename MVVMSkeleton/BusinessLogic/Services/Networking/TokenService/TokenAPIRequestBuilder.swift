//
//  TokenAPIRequestBuilder.swift
//  MVVMSkeleton
//
//  Created by user on 19.01.2022.
//

import Foundation
import CombineNetworking

enum TokenAPIRequestBuilder: CNRequestBuilder {
    case refreshToken(refreshToken: String)
    
    var path: String {
        switch self {
        case .refreshToken:
            return "/v1/token"
        }
    }
    
    var query: QueryItems? {
        switch self {
        case .refreshToken(let token):
            return [
                "grant_type": "refresh_token",
                "refresh_token": token
            ]
        }
    }
    
    var body: Data? {
        switch self {
        case .refreshToken(let model):
            return try? JSONEncoder().encode(model)
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .refreshToken:
            return .post
        }
    }
}