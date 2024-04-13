//
//  OnboardingViewModel.swift
//  MocApp
//
//  Created by Искандер Ситдиков on 30.03.2024.
//

import Foundation
import UIKit

protocol OnboardingViewModel {
    init(registrationHandler: @escaping () -> Void, skipRegistrationHandler: @escaping () -> Void)
    
    func registrationButtonDidTapped()
    func skipRegistrationButtonDidTapped()
}

class OnboardingViewModelImp: OnboardingViewModel {
    
    private let registrationHandler: () -> Void
    private let skipRegistrationHandler: () -> Void

    required init(registrationHandler: @escaping () -> Void, skipRegistrationHandler: @escaping () -> Void) {
        self.registrationHandler = registrationHandler
        self.skipRegistrationHandler = skipRegistrationHandler
    }
    
    func registrationButtonDidTapped() {
        registrationHandler()
    }
    
    func skipRegistrationButtonDidTapped() {
        skipRegistrationHandler()
    }
}
