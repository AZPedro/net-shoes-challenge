//
//  HomeListViewModel.swift
//  netshoes-challenge
//
//  Created by Pedro Azevedo on 20/05/24.
//
import Foundation

final class HomeListViewModel: HomeListViewModelProtocol {
    
    var onloadGistsResult: (() -> Void)?
    var onShowError: ((String) -> Void)?
    
    func loadGists(for page: Int, quantity: Int) {
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 3, execute: { [weak self] in
            guard let self else { return }
            self.onloadGistsResult?()
        })
        
    }
}
