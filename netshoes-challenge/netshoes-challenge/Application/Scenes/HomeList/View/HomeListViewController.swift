//
//  HomeListViewController.swift
//  netshoes-challenge
//
//  Created by Pedro Azevedo on 20/05/24.
//

import UIKit

final class HomeListViewController: UIViewController {
    
    // MARK: - Layout
    
    private lazy var homeView: HomeListView = {
        let view = HomeListView()
        view.delegate = self
        return view
    }()
    
    // MARK: - Properties
    
    private let viewModel: HomeListViewModel
    
    // MARK: - LifeCycle
    
    init(viewModel: HomeListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.view = homeView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    // MARK: - Private functions

    private func bind() {
        
        viewModel.onloadGistsResult = { [weak self] in
            
        }
        
        viewModel.onShowError = { [weak self] _ in
            
        }
    }
}

// MARK: - HomeListViewDelegate

extension HomeListViewController: HomeListViewDelegate {
    
}
