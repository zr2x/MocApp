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
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private let stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 0
        stepper.maximumValue = 100
        return stepper
    }()
    
    private let quantityLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textAlignment = .center
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(productImageView)
        contentView.addSubview(stepper)
        contentView.addSubview(quantityLabel)
    }
    
    private func setupConstraints() {
        
    }
}

