//
//  LoadGistRequestModel.swift
//  netshoes-challenge
//
//  Created by Pedro Azevedo on 21/05/24.
//

import Foundation

struct LoadGistRequestModel: Encodable {

    let page: String
    let quantity: String
    
    enum CodingKeys: String, CodingKey {
        case page, quantity = "per_page"
    }
}
