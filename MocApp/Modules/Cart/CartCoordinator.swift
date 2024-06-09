//
//  CartCoordinator.swift
//  MocApp
//
//  Created by Искандер Ситдиков on 21.04.2024.
//

import UIKit

class CardCoordinator: CoordinatorProtocol {
    var navigationController: UINavigationController
    
    var childCoordinator: CoordinatorProtocol?
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(true, animated: false)
    }
    
    
    func start() {
        let cartViewModel = CartViewModel()
        let cartVC = CartViewController(viewModel: cartViewModel)
        navigationController.pushViewController(cartVC, animated: true)
    }
}
