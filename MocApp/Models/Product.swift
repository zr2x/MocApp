//
//  Product.swift
//  MocApp
//
//  Created by Искандер Ситдиков on 02.06.2024.
//

import Foundation

struct Product: Codable {
    let id: String
    var name: String
    var description: String
    var price: Double
    var category: String
    var isAvailable: Bool
    var imageUrl: URL?
}
