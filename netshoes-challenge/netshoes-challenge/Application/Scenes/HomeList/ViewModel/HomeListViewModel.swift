//
//  HomeListViewModel.swift
//  netshoes-challenge
//
//  Created by Pedro Azevedo on 20/05/24.
//
import Foundation

final class HomeListViewModel: HomeListViewModelProtocol {
    
    // MARK: - Constants
    private struct Constants {
        static let pageLimit: Int = 3
        static let smallQuantity: Int = 10
        static let largeQuantity: Int = 50
    }
    // MARK: - Properties
    
    private let provider: GistRequestProviderProtocol
    
    var models: [HomeListModel] = []
    var onloadGistsResult: (([HomeListModel]) -> Void)?
    var onShowError: ((String) -> Void)?
    
    private var currentPage: Int = 1
    private var isLoading: Bool = false
    
    private var quantity: Int {
        currentPage > Constants.pageLimit ? Constants.largeQuantity : Constants.smallQuantity
    }
    
    init(provider: GistRequestProviderProtocol) {
        self.provider = provider
    }
    
    // MARK: - Functions
    
    func loadGists(for page: Int = 1, quantity: Int = 10) {
        currentPage = page
        isLoading = true
        let requestModel = LoadGistRequestModel(page: "\(page)", quantity: "\(quantity)")
        
        provider.loadGists(requestModel: requestModel) { [weak self] (result: Result<[HomeListModelDTO], Error>) in
            self?.isLoading = false
            
            switch result {
            case .success(let result):
                let homeListModels = result.compactMap({
                    return HomeListModel(name: $0.owner?.login ?? "",
                                         quantity: "\($0.files?.count ?? 0)",
                                         image: $0.owner?.avatar ?? "")
                })
                
                self?.models.append(contentsOf: homeListModels)
                
                guard let models = self?.models else { return }
                self?.onloadGistsResult?(models)
                
            case .failure(let error):
                self?.handleError(error: error)
            }
        }
    }
    
    private func handleError(error: Error) {
        let fallBackErrorMessage: String = "Ops.. Não foi possível recuperar a lista de gists no momento."
        
        if let error = error as? NetworkServiceError {
            switch error {
            case .apiError(let errorModel):
                onShowError?(errorModel.message)
            default:
                onShowError?(fallBackErrorMessage)
            }
        }
    }
    
    func loadGistNextPage() {
        guard !isLoading else { return }
        let nextPage: Int = currentPage + 1
        self.loadGists(for: nextPage, quantity: quantity)
    }
}
