//
//  FileModelDTO.swift
//  netshoes-challenge
//
//  Created by Pedro Azevedo on 21/05/24.
//

import Foundation

struct FileModelDTO: Decodable {
    
    let filename: String?
    
    enum CodingKeys: String, CodingKey {
        case filename
    }
}
