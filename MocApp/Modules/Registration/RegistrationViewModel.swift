//
//  RegistrationViewModel.swift
//  MocApp
//
//  Created by Искандер Ситдиков on 10.04.2024.
//

import Foundation

protocol RegistrationViewModel {
    
    init(finishRegistrationHandler: @escaping () -> Void)
    
    func registrationDidTapped()
}

class RegistrationViewModelImp: RegistrationViewModel {
    
    private let finishRegistrationHandler: () -> Void
    
    required init(finishRegistrationHandler: @escaping () -> Void) {
        self.finishRegistrationHandler = finishRegistrationHandler
    }
    
    func registrationDidTapped() {
        finishRegistrationHandler()
    }
    
    
}
