//
//  DetailsViewModel.swift
//  netshoes-challenge
//
//  Created by Pedro Azevedo on 21/05/24.
//

import Foundation

final class DetailsViewModel: DetailsViewModelProtocol {
    
    // MARK: - Properties
    
    private let model: DetailsModel
    
    init(model: DetailsModel) {
        self.model = model
    }
    
    // MARK: - Functions
    
    func getDetailsModel() -> DetailsModel {
        return model
    }
}
