//
//  ImageLoader.swift
//  MocApp
//
//  Created by Искандер Ситдиков on 02.06.2024.
//

import Foundation

final class ImageLoader {
    static let shared = ImageLoader()
    
    private init() { }
    
    public func downloadImage(_ url: URL,  completion: @escaping (Result<Data, ErrorType>) -> Void) {
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request, completionHandler: { [weak self] data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(ErrorType.badServerResponse))
                return }
            
            completion(.success(data))
        })
    }
}
