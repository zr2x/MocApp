//
//  MainViewModel.swift
//  MocApp
//
//  Created by Искандер Ситдиков on 09.04.2024.
//

import Foundation

class MainViewModel {
    private var products: [Product] = []
    public private(set) var cellViewModels: [MainCollectionViewCellViewModel] = []
    
    public func fetchData() {

       products = [
            Product(
                id: "1",
                name: "Apple iPhone 13",
                description: "The latest iPhone with A15 Bionic chip, 5G capability, and improved camera system.",
                price: 999.99,
                category: "Electronics",
                isAvailable: true,
                imageUrl: URL(string: "https://example.com/iphone13.jpg")
            ),
            Product(
                id: "2",
                name: "Samsung Galaxy S21",
                description: "Flagship smartphone from Samsung with Exynos 2100 processor and Dynamic AMOLED display.",
                price: 899.99,
                category: "Electronics",
                isAvailable: true,
                imageUrl: URL(string: "https://example.com/galaxys21.jpg")
            ),
            Product(
                id: "3",
                name: "Sony WH-1000XM4",
                description: "Industry-leading noise canceling headphones with exceptional sound quality and comfort.",
                price: 349.99,
                category: "Audio",
                isAvailable: true,
                imageUrl: URL(string: "https://example.com/wh1000xm4.jpg")
            ),
            Product(
                id: "4",
                name: "Nike Air Max 270",
                description: "Popular running shoes with a large air unit for maximum cushioning and comfort.",
                price: 150.00,
                category: "Footwear",
                isAvailable: false,
                imageUrl: URL(string: "https://example.com/airmax270.jpg")
            ),
            Product(
                id: "5",
                name: "KitchenAid Stand Mixer",
                description: "Versatile kitchen appliance for mixing, kneading, and whipping with a powerful motor and various attachments.",
                price: 379.99,
                category: "Home Appliances",
                isAvailable: true,
                imageUrl: URL(string: "https://example.com/kitchenaid.jpg")
            ),
            Product(
                id: "6",
                name: "Dell XPS 13",
                description: "Ultra-thin and light laptop with Intel Core i7 processor, 16GB RAM, and 512GB SSD.",
                price: 1299.99,
                category: "Computers",
                isAvailable: true,
                imageUrl: URL(string: "https://example.com/dellxps13.jpg")
            ),
            Product(
                id: "7",
                name: "The Catcher in the Rye",
                description: "Classic novel by J.D. Salinger, originally published in 1951, depicting teenage angst and rebellion.",
                price: 9.99,
                category: "Books",
                isAvailable: true,
                imageUrl: URL(string: "https://example.com/catcherintherye.jpg")
            )
        ]
        cellViewModels = products.map({MainCollectionViewCellViewModel(product: $0)})

    }
}
