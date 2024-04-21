//
//  RegistrationViewModel.swift
//  MocApp
//
//  Created by Искандер Ситдиков on 10.04.2024.
//

import Foundation

protocol RegistrationViewModel {
    func registrationDidTapped()
}

class RegistrationViewModelImp: RegistrationViewModel {
    
    private let finishRegistrationHandler: () -> Void
    
    init(finishRegistrationHandler: @escaping () -> Void) {
        self.finishRegistrationHandler = finishRegistrationHandler
    }
    
    func registrationDidTapped() {
        finishRegistrationHandler()
    }
    
    
}
