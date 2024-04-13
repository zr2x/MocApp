//
//  RegistrationCoordinator.swift
//  MocApp
//
//  Created by Искандер Ситдиков on 31.03.2024.
//

import UIKit

class RegistrationCoordinator: CoordinatorProtocol {
    weak var finishDelegate: CoordinatorFinishDelegate?
    
    var navigationController: UINavigationController
    
    var childCoordinators: [CoordinatorProtocol] = []
    
    var type: CoordinatorType { .app }
    
    func start() {
        
        let viewModel: RegistrationViewModel = RegistrationViewModelImp {
            let mainCoordinator = MainCoordinator(self.navigationController)
            mainCoordinator.start()
        }
        
        let registrationVC = RegistraionViewController(viewModel: viewModel)
        navigationController.setViewControllers([registrationVC], animated: true)
    }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    } 
}
