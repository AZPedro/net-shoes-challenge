//
//  OwnerModelDTO.swift
//  netshoes-challenge
//
//  Created by Pedro Azevedo on 21/05/24.
//

import Foundation

struct OwnerModelDTO: Decodable {
    
    let login: String?
    let avatar: String?
    
    enum CodingKeys: String, CodingKey {
        case login, avatar = "avatar_url"
    }
}
