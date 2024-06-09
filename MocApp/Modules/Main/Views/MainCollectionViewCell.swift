//
//  MainCollectionViewCell.swift
//  MocApp
//
//  Created by Искандер Ситдиков on 18.04.2024.
//

import UIKit
import SnapKit

class MainCollectionViewCell: UICollectionViewCell {
    
    static let identifire = "MainTableViewCell"
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.image = UIImage(named: "tomato")
        return imageView
    }()
    
    private let productNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var addToCartButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setTitle(isAvailable ? "Add to cart" : "Sold out", for: .normal)
        button.backgroundColor = isAvailable ? .systemMint : .lightGray
        return button
    }()
    
    private var isAvailable: Bool = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .lightGray
        contentView.layer.cornerRadius = 10
        addViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        productImageView.image = nil
        productNameLabel.text = nil
        priceLabel.text = nil
        descriptionLabel.text = nil
        addToCartButton.setTitle(nil, for: .normal)
    }
    
    private func addViews() {
        contentView.addSubviews(productImageView,
                                productNameLabel,
                                priceLabel,
                                descriptionLabel,
                                addToCartButton)
    }
    
    
    private func setupConstraints() {
        
        productImageView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(150)
        }
        
        productNameLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(5)
            make.top.equalTo(productImageView.snp.bottom).offset(15)
            make.bottom.equalTo(priceLabel.snp.top).offset(-5)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(5)
            make.top.equalTo(productNameLabel.snp.bottom).offset(10)
            make.bottom.equalTo(descriptionLabel.snp.top).offset(-5)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(5)
            make.top.equalTo(priceLabel.snp.bottom).offset(10)
            make.bottom.lessThanOrEqualTo(addToCartButton.snp.top).offset(-5)
        }
        
        addToCartButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(5)
            make.bottom.equalToSuperview().inset(10)
            make.height.equalTo(30)
        }
    }
    
    public func configure(viewModel: MainCollectionViewCellViewModel) {
        productNameLabel.text = viewModel.name
        priceLabel.text = viewModel.price
        descriptionLabel.text = viewModel.description
        
        viewModel.fetchImage { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self.productImageView.image = image
                }
            case .failure(let error):
                // TODO: handle error
                break
            }
        }
    }
}
