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
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "pencil")
        return imageView
    }()
    
    private let productNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Помидоры 1 кг"
        return label
    }()
    
    private let addToCartButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemMint
        button.setTitle("Add to cart", for: .normal)
        return button
    }()
    
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
        self.productImageView.image = nil
    }
    
    private func addViews() {
        contentView.addSubview(productImageView)
        contentView.addSubview(productNameLabel)
        contentView.addSubview(addToCartButton)
    }
    
    
    private func setupConstraints() {
        
        contentView.snp.makeConstraints { make in
            make.width.height.equalTo(200)
        }
        productImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(100)
        }
        
        productNameLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(productImageView.snp.bottom).offset(20)
        }
        
        addToCartButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(10)
//            make.top.equalTo(productNameLabel.snp.bottom).offset(15)
            make.height.equalTo(40)
        }
    }
}
