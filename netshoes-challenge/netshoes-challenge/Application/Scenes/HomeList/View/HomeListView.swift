//
//  HomeListView.swift
//  netshoes-challenge
//
//  Created by Pedro Azevedo on 20/05/24.
//

import UIKit

protocol HomeListViewDelegate: AnyObject {
    func homeListView(_ view: HomeListView, didSelect model: HomeListModel)
    func homeListView(_ view: HomeListView, willDisplay row: Int)
}

final class HomeListView: UIView {
    
    // MARK: - Constants
    
    struct Constants {
        static let cellHeight: CGFloat = 80
    }
    
    // MARK: - Layout
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()

        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(HomeListTableViewCell.self, forCellReuseIdentifier: HomeListTableViewCell.Constants.cellIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self

        return tableView
    }()
    
    // MARK: - Properties
    
    weak var delegate: HomeListViewDelegate?
    
    var models: [HomeListModel] = [] {
        didSet {
            updateUI()
        }
    }
    
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
    
    private func updateUI() {
        DispatchQueue.main.async {
            UIView.performWithoutAnimation {
                self.tableView.reloadData()
            }
        }
    }
}
