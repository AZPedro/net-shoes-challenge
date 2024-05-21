//
//  HomeListViewModel.swift
//  netshoes-challenge
//
//  Created by Pedro Azevedo on 20/05/24.
//
import Foundation

final class HomeListViewModel: HomeListViewModelProtocol {
    
    private let provider: GistRequestProviderProtocol
    
    var onloadGistsResult: (([HomeListModel]) -> Void)?
    var onShowError: ((String) -> Void)?
    
    init(provider: GistRequestProviderProtocol) {
        self.provider = provider
    }
    
    func loadGists(for page: Int, quantity: Int) {
        let requestModel = LoadGistRequestModel(page: "\(page)", quantity: "\(quantity)")
        
        provider.loadGists(requestModel: requestModel) { [weak self] (result: Result<[HomeListModelDTO], Error>) in
            switch result {
            case .success(let models):
                let homeListModels = models.compactMap({
                    return HomeListModel(name: $0.owner?.login ?? "",
                                         quantity: "\($0.files?.count ?? 0)",
                                         image: $0.owner?.avatar ?? "")
                })
                self?.onloadGistsResult?(homeListModels)
            case .failure(let error):
                self?.onShowError?("Error")
            }
        }
    }
}
