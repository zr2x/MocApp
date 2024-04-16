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
    
    var childCoordinator: CoordinatorProtocol?
    let launchService = FirstLaunchService()
    
    var type: CoordinatorType { .app }
    
    func start() {
//        if launchService.isFirstLaunch() {
            let onBoarding = OnboardingCoordinator(navigationController,
                                                   onRegistration: onRegistration,
                                                   onSkipRegistration: onSkipRegistration)
            onBoarding.finishDelegate = self
            onBoarding.start()
            childCoordinator = onBoarding
//        } else {
//            let tabBarCoordinator = AuthorizedFlowCoordinator(navigationController)
//            tabBarCoordinator.finishDelegate = self
//            tabBarCoordinator.start()
//            childCoordinators.append(tabBarCoordinator)
//        }
    }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(true, animated: true)
    }
    
    private func onRegistration() {
        let registrationCoordinator = RegistrationCoordinator(self.navigationController)
        registrationCoordinator.start()
        childCoordinator = registrationCoordinator
    }
    
    private func onSkipRegistration() {
        // создали
        let mainCoordintator = MainCoordinator(self.navigationController)
        // сделали переход
        mainCoordintator.start()
        childCoordinator = mainCoordintator
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol) {
//        childCoordinators = childCoordinators.filter({ $0.type != childCoordinator.type})
//        
//        switch childCoordinator.type {
//        case .tab:
//            navigationController.viewControllers.removeAll()
//            start()
//        case .main:
//            navigationController.viewControllers.removeAll()
//            start()
//        default:
//            break
//        }
    }
}
