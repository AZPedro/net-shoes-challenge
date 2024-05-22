//
//  InfoDetailComponentView.swift
//  netshoes-challenge
//
//  Created by Pedro Azevedo on 21/05/24.
//

import UIKit

final class InfoDetailComponentView: UIView {
    
    // MARK: - Constants
    
    private struct Constants {
        static let fontSize: CGFloat = 18
    }
    
    // MARK: - Layout
    
    private lazy var stackContent: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(valueLabel)
        
        return stack
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.systemGray
        label.text = title
        label.font = UIFont.systemFont(ofSize: Constants.fontSize, weight: .bold)
        return label
    }()
    
    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.systemGray
        label.font = UIFont.systemFont(ofSize: Constants.fontSize, weight: .regular)
        return label
    }()
    
    // MARK: - Properties
    
    private let title: String
    
    var model: InfoDetailComponentModel? {
        didSet {
            guard let model else { return }
            updateUI(model: model)
        }
    }
    
    // MARK: - LifeCycle
    
    init(title: String) {
        self.title = title
        super.init(frame: .zero)
        setupIU()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private functions
    
    private func setupIU() {
        addSubview(stackContent)

        NSLayoutConstraint.activate([
            stackContent.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackContent.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackContent.topAnchor.constraint(equalTo: topAnchor),
            stackContent.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func updateUI(model: InfoDetailComponentModel) {
        DispatchQueue.main.async {
            self.valueLabel.text = model.value
        }
    }
}
