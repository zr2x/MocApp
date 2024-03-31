//
//  AppCoordinator.swift
//  MocApp
//
//  Created by Искандер Ситдиков on 24.03.2024.
//

import UIKit


class AppCoordinator: CoordinatorProtocol {
    var finishDelegate: CoordinatorFinishDelegate?
    
    var navigationController: UINavigationController
    
    var childCoordinators: [CoordinatorProtocol] = []
    
    var type: CoordinatorType { .app }
    
    func start() {
//        let tabBarCoordinator = TabBarCoordinator(navigationController)
//        tabBarCoordinator.finishDelegate = self
//        tabBarCoordinator.start()
//        childCoordinators.append(tabBarCoordinator)
        
        let onBoarding = OnboardingCoordinator(navigationController)
        onBoarding.finishDelegate = self
        onBoarding.start()
        childCoordinators.append(onBoarding)
    }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(true, animated: true)
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol) {
        childCoordinators = childCoordinators.filter({ $0.type != childCoordinator.type})
        
        switch childCoordinator.type {
        case .tab:
            navigationController.viewControllers.removeAll()
            start()
        case .main:
            navigationController.viewControllers.removeAll()
            start()
        default:
            break
        }
    }
}
