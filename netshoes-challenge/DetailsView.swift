//
//  DetailsView.swift
//  netshoes-challenge
//
//  Created by Pedro Azevedo on 21/05/24.
//

import UIKit
import Kingfisher

final class DetailsView: UIView {
    
    // MARK: - Constants
    
    struct Constants {
        static let avatarImageHeight: CGFloat = 260
        static let stackContentSpacing: CGFloat = 16
    }
    
    // MARK: - Layout
    
    private lazy var stackContent: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = Constants.stackContentSpacing
        stack.addArrangedSubview(topContentStack)
        stack.addArrangedSubview(bottomContentStack)
        
        return stack
    }()
    
    private lazy var topContentStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.addArrangedSubview(headerImageView)
        return stack
    }()
    
    private lazy var headerImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: Constants.avatarImageHeight).isActive = true
        
        return view
    }()
    
    private lazy var bottomContentStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = .init(top: 0,
                                    left: Constants.stackContentSpacing,
                                    bottom: 0,
                                    right: Constants.stackContentSpacing)
        stack.addArrangedSubview(nameInfoComponentView)
        return stack
    }()
    
    private lazy var nameInfoComponentView: InfoDetailComponentView = {
        let view = InfoDetailComponentView(title: "Usuário - ")
        return view
    }()
    
    // MARK: - Properties
    
    var model: DetailsModel? {
        didSet {
            guard let model else { return }
            updateUI(model: model)
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
        addSubview(stackContent)
        
        NSLayoutConstraint.activate([
            stackContent.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            stackContent.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            stackContent.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackContent.bottomAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func updateUI(model: DetailsModel) {
        headerImageView.kf.setImage(with: URL(string: model.image), placeholder: nil, options: [
            .loadDiskFileSynchronously,
            .cacheOriginalImage,
            .transition(.fade(0.3))
        ])
        nameInfoComponentView.model = .init(value: model.name)
    }
}
