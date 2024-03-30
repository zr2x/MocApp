//
//  LaunchService.swift
//  MocApp
//
//  Created by Искандер Ситдиков on 24.03.2024.
//

import Foundation

struct FirstLaunchService {
    
    private let isFirstLaunchKey = "FirstLogin"
    
    func isFirstLaunch() -> Bool {
        return arc4random_uniform(2) == 0
    }
}
