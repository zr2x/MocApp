//
//  OnboardingCoordinator.swift
//  MocApp
//
//  Created by Искандер Ситдиков on 28.03.2024.
//

import UIKit

class OnboardingCoordinator: CoordinatorProtocol {
    var finishDelegate: CoordinatorFinishDelegate?
    
    var navigationController: UINavigationController
    
    var childCoordinators: [CoordinatorProtocol] = []
    
    var type: CoordinatorType { .onBorading }
    
    func start() {
        let onboradingVC = OnboradingViewController()
        navigationController.pushViewController(onboradingVC, animated: true)
    }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(true, animated: true)
    }
}

extension OnboardingCoordinator: CoordinatorFinishDelegate {
    
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol) {
        let tabBarCoordinator = TabBarCoordinator(navigationController)
        tabBarCoordinator.finishDelegate = self
        tabBarCoordinator.start()
        childCoordinators.append(tabBarCoordinator)
    }
}
