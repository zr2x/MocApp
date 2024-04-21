//
//  AppCoordinator.swift
//  MocApp
//
//  Created by Искандер Ситдиков on 24.03.2024.
//

import UIKit


class AppCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController
    
    var childCoordinator: CoordinatorProtocol?
    let launchService = FirstLaunchService()
    

    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(true, animated: true)
    }
    
    
    func start() {
//        if launchService.isFirstLaunch() {
//            let onBoarding = OnboardingCoordinator(navigationController,
//                                                   onRegistration: onRegistration,
//                                                   onSkipRegistration: onSkipRegistration)
//            onBoarding.finishDelegate = self
//            onBoarding.start()
//            childCoordinator = onBoarding
//        } else {
            let tabBarCoordinator = AuthorizedFlowCoordinator(navigationController)
            tabBarCoordinator.start()
            childCoordinator = tabBarCoordinator
//        }
    }
    
    private func onRegistration() {
        let registrationCoordinator = RegistrationCoordinator(self.navigationController)
        registrationCoordinator.start()
        childCoordinator = registrationCoordinator
    }
    
    private func onSkipRegistration() {
        let mainCoordintator = MainCoordinator(self.navigationController)
        mainCoordintator.start()
        childCoordinator = mainCoordintator
    }
}
