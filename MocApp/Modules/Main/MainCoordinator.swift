//
//  MainCoordinator.swift
//  MocApp
//
//  Created by Искандер Ситдиков on 09.04.2024.
//

import UIKit

class MainCoordinator: CoordinatorProtocol {
    var finishDelegate: CoordinatorFinishDelegate?
    
    var navigationController: UINavigationController
    
    var childCoordinators: [CoordinatorProtocol] = []
    
    var type: CoordinatorType { .main}
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    

    func start() {
        let mainVC = MainViewController()
        navigationController.pushViewController(mainVC, animated: true)
    }
    
}