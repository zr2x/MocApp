//
//  MainCollectionViewCellViewModel.swift
//  MocApp
//
//  Created by Искандер Ситдиков on 09.06.2024.
//

import Foundation

final class MainCollectionViewCellViewModel {
    private var product: Product
    
    public var id: String {
        return product.id
    }
    
    public var name: String {
        product.name
    }
    
    public var description: String {
        return product.description
    }

    public var price: String {
        return "$\(product.price)"
    }

    public var category: String {
        return product.category
    }

    public var isAvailable: Bool {
        return product.isAvailable
    }

    public var imageUrl: URL? {
        return product.imageUrl
    }
    
    init(product: Product) {
        self.product = product
    }
    
    public func fetchImage(completion: @escaping (Result<Data, ErrorType>) -> Void) {
        guard let url = product.imageUrl else {
            completion(.failure(ErrorType.badUrl))
            return }
        ImageLoader.shared.downloadImage(url, completion: completion)
    }
}
