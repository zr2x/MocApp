//
//  RegistrationCoordinator.swift
//  MocApp
//
//  Created by Искандер Ситдиков on 31.03.2024.
//

import UIKit

class RegistrationCoordinator: CoordinatorProtocol {
    var finishDelegate: CoordinatorFinishDelegate?
    
    var navigationController: UINavigationController
    
    var childCoordinators: [CoordinatorProtocol] = []
    
    var type: CoordinatorType { .app }
    
    func start() {
        let registrationVC = RegistraionViewController()
        navigationController.pushViewController(registrationVC, animated: true)
    }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    } 
}
