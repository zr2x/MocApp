//
//  Extensions.swift
//  MocApp
//
//  Created by Искандер Ситдиков on 09.06.2024.
//

import UIKit

extension UIView {
    func addSubviews(_ view: UIView...) {
        view.forEach({
            self.addSubview($0)
        })
    }
}
