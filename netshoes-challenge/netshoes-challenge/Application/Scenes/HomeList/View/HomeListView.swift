//
//  HomeListView.swift
//  netshoes-challenge
//
//  Created by Pedro Azevedo on 20/05/24.
//

import UIKit

protocol HomeListViewDelegate: AnyObject {
    
}

final class HomeListView: UIView {
    
    // MARK: - Layout
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()

        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false

        return tableView
    }()
    
    // MARK: - Properties
    
    weak var delegate: HomeListViewDelegate?
    
    // MARK: - LifeCycle
    
    init() {
        super.init(frame: .zero)
        setupIU()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private functions
    
    private func setupIU() {
        backgroundColor = .white
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
