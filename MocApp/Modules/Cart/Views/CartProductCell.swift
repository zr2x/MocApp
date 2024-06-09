//
//  CartProductCell.swift
//  MocApp
//
//  Created by Искандер Ситдиков on 21.04.2024.
//

import UIKit
import SnapKit

class CartProductCell: UITableViewCell {
    static let identifire = "CartProductCell"
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "tomato")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private var productNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()
    
    private var priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()
    
    private let decreaseAmountButton: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.addTarget(nil, action: #selector(decreaseButtonDidTapped), for: .touchUpInside)
        return button
    }()
    
    private let increaseAmountButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.addTarget(nil, action: #selector(increaseButtonDidTapped), for: .touchUpInside)
        return button
    }()
    
    private let quantityLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.isUserInteractionEnabled = false
        return label
    }()
    
    private let amountStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 5
        stack.backgroundColor = .lightGray
        stack.layer.cornerRadius = 10
        stack.distribution = .equalSpacing
        return stack
    }()
    
    private let productStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fillEqually
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View hierarchy
    
    private func setupUI() {
        contentView.addSubview(productStackView)
        contentView.addSubview(amountStackView)
        contentView.addSubview(productImageView)
        
        productStackView.addArrangedSubview(productNameLabel)
        productStackView.addArrangedSubview(priceLabel)
        
        amountStackView.addArrangedSubview(decreaseAmountButton)
        amountStackView.addArrangedSubview(quantityLabel)
        amountStackView.addArrangedSubview(increaseAmountButton)
    }
    
    
    // MARK: - Layout
    
    private func setupConstraints() {
        
        contentView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(150)
        }
        
        productImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview().offset(-20)
            make.width.equalTo(75)
        }
        
        productStackView.snp.makeConstraints { make in
            make.leading.equalTo(productImageView.snp.trailing).inset(-20)
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(amountStackView.snp.top).offset(-10)
        }
        
        amountStackView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(30)
            make.bottom.equalToSuperview().offset(-10)
            make.height.equalTo(30)
        }
    }
    
    //MARK: - Action
    
    private func getCurrentQuantity() -> Int {
        guard let currentQuantity = Int(quantityLabel.text ?? "0"), currentQuantity > 0 else { return 0 }
        return currentQuantity
    }
    
    @objc private func decreaseButtonDidTapped() {
        self.quantityLabel.text = "\(getCurrentQuantity() - 1)"
    }
    
    @objc private func increaseButtonDidTapped() {
        self.quantityLabel.text = "\(getCurrentQuantity() + 1)"
    }
    
    public func configure(with viewModel: CartProductCellViewModel) {
        self.productNameLabel.text = viewModel.name
        self.priceLabel.text = viewModel.price

        viewModel.fetchImage { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self.productImageView.image = image
                }
            case .failure:
                // TODO: handle error
                break
            }
        }
    }
}

