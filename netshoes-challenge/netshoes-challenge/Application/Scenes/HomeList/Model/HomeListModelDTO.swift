//
//  HomeListModelDTO.swift
//  netshoes-challenge
//
//  Created by Pedro Azevedo on 21/05/24.
//

import Foundation

struct HomeListModelDTO: Decodable {
    
    let owner: OwnerModelDTO?
    let files: [String: FileModelDTO]?
    
    enum CodingKeys: CodingKey {
        case owner
        case files
    }
}

