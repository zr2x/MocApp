//
//  CartProductCellViewModel.swift
//  MocApp
//
//  Created by Искандер Ситдиков on 02.06.2024.
//

import Foundation

final class CartProductCellViewModel {
    private let product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    public var name: String {
        return product.name
    }
    
    public var price: String {
        return "\(product.price)"
    }
    
    public var description: String {
        return product.description
    }
    
    public func fetchImage(completion: @escaping (Result<Data, ErrorType>) -> Void) {
        guard let url = product.imageUrl else {
            completion(.failure(ErrorType.badUrl))
            return }
        ImageLoader.shared.downloadImage(url, completion: completion)
    }
}
