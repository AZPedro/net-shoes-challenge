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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        bind()
        loadData()
    }
    
    // MARK: - Private functions

    private func loadData() {
        viewModel.loadGists(for: 1, quantity: 30)
    }
    
    private func bind() {
        
        viewModel.onloadGistsResult = { [weak self] models in
            self?.homeView.models = models
        }
        
        viewModel.onShowError = { [weak self] _ in
            
        }
    }
}

// MARK: - HomeListViewDelegate

extension HomeListViewController: HomeListViewDelegate {
    
}
