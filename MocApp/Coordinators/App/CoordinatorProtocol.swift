//
//  CoordinatorProtocol.swift
//  MocApp
//
//  Created by Искандер Ситдиков on 24.03.2024.
//

import UIKit

// MARK: - Coordinator

protocol CoordinatorProtocol: AnyObject {
    var finishDelegate: CoordinatorFinishDelegate? { get set }
    var navigationController: UINavigationController { get set }
    var childCoordinator: CoordinatorProtocol? { get set }
    var type: CoordinatorType { get }
    
    func start()
    func finish()
}

extension CoordinatorProtocol {
    func finish() {
        childCoordinator = nil
        finishDelegate!.coordinatorDidFinish(childCoordinator: self)
    }
}

// MARK: - CoordinatorOutput

protocol CoordinatorFinishDelegate: AnyObject {
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol)
}

// MARK: - CoordinatorType

enum CoordinatorType {
    case app, main, tab, onBorading
}
