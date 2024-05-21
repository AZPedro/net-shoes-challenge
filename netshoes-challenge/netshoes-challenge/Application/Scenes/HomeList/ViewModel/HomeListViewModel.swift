//
//  HomeListViewModel.swift
//  netshoes-challenge
//
//  Created by Pedro Azevedo on 20/05/24.
//
import Foundation

final class HomeListViewModel: HomeListViewModelProtocol {
    
    private let provider: GistRequestProviderProtocol
    
    var onloadGistsResult: (() -> Void)?
    var onShowError: ((String) -> Void)?
    
    init(provider: GistRequestProviderProtocol) {
        self.provider = provider
    }
    
    func loadGists(for page: Int, quantity: Int) {
        let requestModel = LoadGistRequestModel(page: "\(page)", quantity: "\(quantity)")
        
        provider.loadGists(requestModel: requestModel) { [weak self] (result: Result<String, Error>) in
            switch result {
            case .success(let model):
                self?.onloadGistsResult?()
            case .failure(let error):
                self?.onShowError?("Error")
            }
        }
    }
}
