//
//  HomeListViewModelProtocol.swift
//  netshoes-challenge
//
//  Created by Pedro Azevedo on 20/05/24.
//

import Foundation

protocol HomeListViewModelProtocol {
    
    var models: [HomeListModel] { get set }
    var onloadGistsResult: (([HomeListModel]) -> Void)? { get set }
    var onShowError: ((String) -> Void)? { get set }
    
    func loadGists(for page: Int, quantity: Int)
    func loadGistNextPage()
}
