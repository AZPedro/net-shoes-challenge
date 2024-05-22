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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = homeView
        bind()
        loadData()
    }
    
    // MARK: - Private functions

    private func loadData() {
        viewModel.loadGists()
    }
    
    private func bind() {
        
        viewModel.onloadGistsResult = { [weak self] models in
            self?.homeView.models = models
        }
        
        viewModel.onShowError = { [weak self] message in
            self?.showErrorAlert(message: message)
        }
    }
    
    private func showDetails(for model: DetailsModel) {
        let detailsViewModel = DetailsViewModel(model: model)
        let detailsViewController = DetailsViewController(viewModel: detailsViewModel)
    
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
    
    private func showErrorAlert(message: String) {
        let alertViewController = UIAlertController(title: "Ops..!", message: message, preferredStyle: .alert)
        alertViewController.addAction(.init(title: "Ok", style: .default, handler: nil))
        DispatchQueue.main.async {
            self.navigationController?.present(alertViewController, animated: true)
        }
    }
}

// MARK: - HomeListViewDelegate

extension HomeListViewController: HomeListViewDelegate {
    
    func homeListView(_ view: HomeListView, willDisplay row: Int) {
        guard row >= viewModel.models.count - 5 else { return }
        viewModel.loadGistNextPage()
    }
    
    func homeListView(_ view: HomeListView, didSelect model: HomeListModel) {
        
        let detailsModel: DetailsModel = .init(name: model.name, image: model.image)
        showDetails(for: detailsModel)
    }
}
