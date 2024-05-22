//
//  Encodable+extensions.swift
//  netshoes-challenge
//
//  Created by Pedro Azevedo on 21/05/24.
//

import Foundation

extension Encodable {
    subscript(key: String) -> Any? {
        return dictionary[key]
    }
    var dictionary: [String: Any] {
        return (try? JSONSerialization.jsonObject(with: JSONEncoder().encode(self))) as? [String: Any] ?? [:]
    }
}
