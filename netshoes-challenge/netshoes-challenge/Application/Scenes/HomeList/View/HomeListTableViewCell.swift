//
//  HomeListTableViewCell.swift
//  netshoes-challenge
//
//  Created by Pedro Azevedo on 20/05/24.
//

import UIKit

final class HomeListTableViewCell: UITableViewCell {
    
    // MARK: - Constants
    
    struct Constants {
        static let cellIdentifier: String = "homeListTableViewCellReusableIdentifier"
    }
    
    // MARK: - Layout
    
    // MARK: - LifeCycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private functions
    
    private func setupUI() {
        backgroundColor = .systemPink
    }
}
