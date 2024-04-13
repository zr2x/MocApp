//
//  OnboardingCoordinator.swift
//  MocApp
//
//  Created by Искандер Ситдиков on 28.03.2024.
//

import UIKit

class OnboardingCoordinator: CoordinatorProtocol {
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    
    var childCoordinators: [CoordinatorProtocol] = []
    
    var type: CoordinatorType { .onBorading }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = OnboardingViewModelImp {
            let registrationCoordinator = RegistrationCoordinator(self.navigationController)
            registrationCoordinator.start()
            
            //FIXME: fix handler
        } skipRegistrationHandler: {
            let mainCoordintator = MainCoordinator(self.navigationController)
            mainCoordintator.start()
        }


        let onboradingVC = OnboradingViewController(viewModel: viewModel)
        navigationController.pushViewController(onboradingVC, animated: true)
    }
}

