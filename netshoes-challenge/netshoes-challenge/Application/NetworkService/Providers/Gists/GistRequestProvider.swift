//
//  GistRequestProvider.swift
//  netshoes-challenge
//
//  Created by Pedro Azevedo on 21/05/24.
//

import Foundation

protocol GistRequestProviderProtocol {
    func loadGists<T: Decodable>(requestModel: LoadGistRequestModel, completion: ((Result<T, Error>) -> Void)?)
    func loadGistDetails<T: Decodable>(gistId: Int, completion: ((Result<T, Error>) -> Void)?)
}

final class GistRequestProvider: GistRequestProviderProtocol {
    
    private let service: NetworkServiceProtocol
    private let path: String = "https://api.github.com/gists/public"
    
    init(service: NetworkServiceProtocol) {
        self.service = service
    }
    
    func loadGists<T>(requestModel: LoadGistRequestModel, completion: ((Result<T, Error>) -> Void)?) where T : Decodable {
        let parameters = requestModel.dictionary as? [String: String] ?? [:]
        
        service.request(urlPath: path,
                        parameters: parameters,
                        completion: completion)
    }
    
    func loadGistDetails<T>(gistId: Int, completion: ((Result<T, Error>) -> Void)?) where T : Decodable {
        
    }
}
