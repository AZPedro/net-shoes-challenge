//
//  NetworkService.swift
//  netshoes-challenge
//
//  Created by Pedro Azevedo on 20/05/24.
//

import Foundation

protocol NetworkServiceProtocol {
    func request<T: Decodable>(urlPath: String, parameters: [String: String], completion: ((Result<T, Error>) -> Void)?)
}

final class NetworkService: NetworkServiceProtocol {
    func request<T: Decodable>(urlPath: String, parameters: [String : String], completion: ((Result<T, Error>) -> Void)?) {
        
        do {
            
            let url = try buildComponents(path: urlPath, parameters: parameters)
            let request = URLRequest(url: url)
            self.perform(request: request, completion: completion)
            
        } catch {
            completion?(.failure(error))
        }
    }
    
    private func buildComponents(path: String, parameters: [String: String]) throws -> URL {
        guard var components = URLComponents(string: path) else {
            throw URLError(.badURL)
        }
        
        components.queryItems = parameters.map({ URLQueryItem(name: $0.key, value: $0.value) })
        
        guard let url = components.url else {
            throw URLError(.badURL)
        }
        
        return url
    }
    
    private func perform<T: Decodable>(request: URLRequest, completion: ((Result<T, Error>) -> Void)?) {
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let model = try JSONDecoder().decode(T.self, from: data)
                    completion?(.success(model))
                } catch {
                    if let apiError = try? JSONDecoder().decode(ErrorModel.self, from: data) {
                        completion?(.failure(NetworkServiceError.apiError(apiError)))
                    } else {
                        completion?(.failure(error))
                    }
                }
                
            } else if let error = error {
                completion?(.failure(error))
            }
        }

        task.resume()
    }

}
