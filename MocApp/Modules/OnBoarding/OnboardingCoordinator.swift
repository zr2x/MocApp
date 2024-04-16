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
    
    var childCoordinator: CoordinatorProtocol?
    
    var type: CoordinatorType { .onBorading }
    
    private let onRegistration: () -> Void
    private let onSkipRegistration: () -> Void
    
    required init(_ navigationController: UINavigationController,
                  onRegistration: @escaping () -> Void,
                  onSkipRegistration: @escaping () -> Void) {
        self.navigationController = navigationController
        self.onRegistration = onRegistration
        self.onSkipRegistration = onSkipRegistration
    }
    
    func start() {
        let viewModel = OnboardingViewModelImp(registrationHandler: onRegistration,
                                               skipRegistrationHandler: onSkipRegistration)

        let onboradingVC = OnboradingViewController(viewModel: viewModel)
        navigationController.pushViewController(onboradingVC, animated: true)
    }
}

