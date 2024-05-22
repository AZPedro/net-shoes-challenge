//
//  DetailsViewController.swift
//  netshoes-challenge
//
//  Created by Pedro Azevedo on 21/05/24.
//

import UIKit

final class DetailsViewController: UIViewController {
    
    // MARK: - Layout
    
    private lazy var detailsView: DetailsView = {
        let view = DetailsView()
        return view
    }()
    
    // MARK: - Properties
    
    private let viewModel: DetailsViewModel
    
    // MARK: - LifeCycle
    
    init(viewModel: DetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = detailsView
        bind()
    }
    
    // MARK: - Private functions
    
    private func bind() {
        detailsView.model = viewModel.getDetailsModel()
    }
}
