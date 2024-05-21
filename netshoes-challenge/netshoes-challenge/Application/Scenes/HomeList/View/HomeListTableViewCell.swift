//
//  HomeListTableViewCell.swift
//  netshoes-challenge
//
//  Created by Pedro Azevedo on 20/05/24.
//

import UIKit

struct HomeListCellModel {
    let name: String
    let quantity: String
}

final class HomeListTableViewCell: UITableViewCell {
    
    // MARK: - Constants
    
    struct Constants {
        static let cellIdentifier: String = "homeListTableViewCellReusableIdentifier"
        static let avatarImageSize: CGFloat = 64
        static let leftTopBottomMargins: CGFloat = 8
    }
    
    // MARK: - Layout
    
    private lazy var horizontalStackContent: UIStackView = {
        let stack = UIStackView()
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 8
        stack.addArrangedSubview(avatarImageStackView)
        stack.addArrangedSubview(verticalStackContent)
        
        return stack
    }()
    
    private lazy var avatarImageStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.addArrangedSubview(avatarImageView)
        
        return stack
    }()
    
    private lazy var avatarImageView: UIImageView = {
        let view = UIImageView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = (Constants.avatarImageSize / 2)
        
        view.widthAnchor.constraint(equalToConstant: Constants.avatarImageSize).isActive = true
        view.heightAnchor.constraint(equalToConstant: Constants.avatarImageSize).isActive = true
        view.backgroundColor = .red
        
        return view
    }()
    
    private lazy var verticalStackContent: UIStackView = {
        let stack = UIStackView()
    
        stack.axis = .vertical
        stack.spacing = Constants.leftTopBottomMargins
        stack.alignment = .leading
        stack.addArrangedSubview(nameInfoComponentView)
        stack.addArrangedSubview(fileInfoComponentView)
        
        return stack
    }()
    
    private lazy var nameInfoComponentView: InfoDetailComponentView = {
        let view = InfoDetailComponentView(title: "Usuário - ")
        return view
    }()
    
    private lazy var fileInfoComponentView: InfoDetailComponentView = {
        let view = InfoDetailComponentView(title: "Arquivos - ")
        return view
    }()
    
    // MARK: - Properties
    
    var model: HomeListCellModel? {
        didSet {
            guard let model else { return }
            self.updateUI(model: model)
        }
    }
    
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
        contentView.addSubview(horizontalStackContent)
        NSLayoutConstraint.activate([
            horizontalStackContent.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.leftTopBottomMargins),
            horizontalStackContent.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.leftTopBottomMargins),
            horizontalStackContent.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.leftTopBottomMargins),
            horizontalStackContent.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    private func updateUI(model: HomeListCellModel) {
        nameInfoComponentView.model = .init(value: model.name)
        fileInfoComponentView.model = .init(value: model.quantity)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameInfoComponentView.model = .init(value: "")
        fileInfoComponentView.model = .init(value: "")
    }
}
