//
//  MainCoordinator.swift
//  MocApp
//
//  Created by Искандер Ситдиков on 09.04.2024.
//

import UIKit

class MainCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController
    
    var childCoordinator: CoordinatorProtocol?
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    

    func start() {
        let mainVC = MainViewController()
        navigationController.pushViewController(mainVC, animated: true)
    }
    
}
