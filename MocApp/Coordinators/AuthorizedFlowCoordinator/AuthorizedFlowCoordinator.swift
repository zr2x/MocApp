//
//  AuthorizedFlowCoordinator.swift
//  MocApp
//
//  Created by Искандер Ситдиков on 24.03.2024.
//

import UIKit

enum TabBarPage {
    case main
    case favourite
    case cart
    case profile
    
    init?(index: Int) {
        switch index {
        case 0:
            self = .main
        case 1:
            self = .favourite
        case 2:
            self = .cart
        case 3:
            self = .profile
        default:
            return nil
        }
    }
    
    func pageTitleValue() -> String {
        switch self {
        case .main:
            return "Меню"
        case .favourite:
            return "Избранное"
        case .cart:
            return "Корзина"
        case .profile:
            return "Профиль"
        }
    }
    
    func pageOrderNumber() -> Int {
        switch self {
        case .main:
            return 0
        case .favourite:
            return 1
        case .cart:
            return 2
        case .profile:
            return 3
        }
    }
    
    func pageIconValue() -> UIImage {
        switch self {
        case .main:
            return UIImage(systemName: "book.fill")!
        case .favourite:
            return UIImage(systemName: "heart.fill")!
        case .cart:
            return UIImage(systemName: "cart.circle.fill")!
        case .profile:
            return UIImage(systemName: "person.crop.circle.fill")!
        }
    }
}

protocol AuthorizedFlowCoordinatorProtocol: CoordinatorProtocol {
    
    var tabBarController: UITabBarController { get set }
    
    func selectPage(_ page: TabBarPage)
    
    func setSelectedIndex(_ index: Int)
    
    func currentPage() -> TabBarPage?
}

class AuthorizedFlowCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController
    
    var tabBarController: UITabBarController
    
    var childCoordinator: CoordinatorProtocol?
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.tabBarController = UITabBarController()
    }
    
    func start() {
        let pages: [TabBarPage] = [.main, .favourite, .cart, .profile]
        
        let controllers: [UINavigationController] = pages.map({ getTabController($0) })
        
        prepareTabBarController(withTabControllers: controllers)
    }
    
    private func prepareTabBarController(withTabControllers tabBarControllers: [UIViewController]) {
        tabBarController.setViewControllers(tabBarControllers, animated: true)
        tabBarController.selectedIndex  = TabBarPage.main.pageOrderNumber()
        tabBarController.tabBar.isTranslucent = false
        tabBarController.tabBar.backgroundColor = .white
        navigationController.viewControllers = [tabBarController]
    }
    
    private func getTabController(_ page: TabBarPage) -> UINavigationController {
        let navController = UINavigationController()
        navController.setNavigationBarHidden(false, animated: true)
        navController.tabBarItem = UITabBarItem(title: page.pageTitleValue(),
                                                image: page.pageIconValue(),
                                                tag: page.pageOrderNumber())
        switch page {
        case .main:
            let mainCoordinator = MainCoordinator(navController)
            mainCoordinator.start()
        case .favourite:
            break
        case .cart:
            let cartCoordinator = CardCoordinator(navController)
            cartCoordinator.start()
        case .profile:
            break
        }
        return navController
    }
    
    func currentPage() -> TabBarPage? {
        TabBarPage(index: tabBarController.selectedIndex)
    }
    
    func selectPage(_ page: TabBarPage) {
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
    
    func setselectedIndex(_ index: Int) {
        guard let page = TabBarPage(index: index) else { return }
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
}
