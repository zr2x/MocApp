//
//  CoordinatorProtocol.swift
//  MocApp
//
//  Created by Искандер Ситдиков on 24.03.2024.
//

import UIKit

// MARK: - Coordinator

protocol CoordinatorProtocol: AnyObject {
    var navigationController: UINavigationController { get set }
    var childCoordinator: CoordinatorProtocol? { get set }
    
    func start()
    func finish()
}

extension CoordinatorProtocol {
    func finish() {
        childCoordinator = nil
    }
}
