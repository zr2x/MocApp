//
//  OnboardingViewModel.swift
//  MocApp
//
//  Created by Искандер Ситдиков on 30.03.2024.
//

import Foundation
import UIKit

protocol OnboardingViewModel {
    var registrationCoordinator: RegistrationCoordinator? { get set }
    
    func obtainRegistationModule()
    
}

class OnboardingViewModelImp: OnboardingViewModel {
    
    lazy var navVC = UINavigationController()
    
    weak var registrationCoordinator: RegistrationCoordinator?

    func obtainRegistationModule() {
        registrationCoordinator?.start()
    }
}
