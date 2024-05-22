//
//  NetworkServiceError.swift
//  netshoes-challenge
//
//  Created by Pedro Azevedo on 21/05/24.
//

import Foundation

enum NetworkServiceError: Error {
    case invalidData
    case apiError(ErrorModel)
    
    var message: String {
        switch self {
        case .invalidData:
            return "Invalid data"
        case .apiError(let model):
            return model.message
        }
    }
}

struct ErrorModel: Decodable {
    let message: String
}
