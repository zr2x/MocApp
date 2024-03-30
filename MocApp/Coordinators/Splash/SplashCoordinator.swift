//
//  SplashCoordinator.swift
//  MocApp
//
//  Created by Искандер Ситдиков on 28.03.2024.
//

import UIKit

class SplashCoordinator: CoordinatorProtocol {
    var finishDelegate: CoordinatorFinishDelegate?
    
    var navigationController: UINavigationController
    
    var childCoordinators: [CoordinatorProtocol] = []
    
    var type: CoordinatorType { .splash }
    
    func start() {
        let splashVC = SplashViewController()
        navigationController.pushViewController(splashVC, animated: true)
    }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(true, animated: true)
    }
}

extension SplashCoordinator: CoordinatorFinishDelegate {
    
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol) {
        let tabBarCoordinator = TabBarCoordinator(navigationController)
        tabBarCoordinator.finishDelegate = self
        tabBarCoordinator.start()
        childCoordinators.append(tabBarCoordinator)
    }
}
