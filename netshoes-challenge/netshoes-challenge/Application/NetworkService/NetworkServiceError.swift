//
//  NetworkServiceError.swift
//  netshoes-challenge
//
//  Created by Pedro Azevedo on 21/05/24.
//

import Foundation

enum NetworkServiceError: Error {
    case invalidData
    
    var message: String {
        switch self {
        case .invalidData:
            "Invalid return data"
        }
    }
}
