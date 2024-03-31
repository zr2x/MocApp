//
//  OnBoardingViewController.swift
//  MocApp
//
//  Created by Искандер Ситдиков on 30.03.2024.
//

import UIKit
import SnapKit

struct Appereance {
    static let buttonHeight: CGFloat = 48.0
    static let bottomMargin: CGFloat = 12.0
    static let sideMargin: CGFloat = 20.0
}

class OnboradingViewController: UIViewController {
    
    let viewModel: OnboardingViewModel = OnboardingViewModelImp()
    
    private let registrationButton: UIButton = {
        let button = UIButton()
        button.setTitle("Регистрация", for: .normal)
        button.setTitleColor(.cyan, for: .normal)
        button.backgroundColor = .yellow
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(registrationDidTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .orange
        addViews()
        setupConstraints()
    }
    
    // MARK: - Action
    
    @objc private func registrationDidTapped() {
        viewModel.obtainRegistationModule()
    }
    
    // MARK: - Layout
    
    private func addViews() {
        view.addSubview(registrationButton)
    }
    
    private func setupConstraints() {
        
        registrationButton.snp.makeConstraints { make in
            make.height.equalTo(Appereance.buttonHeight)
            make.leading.trailing.equalToSuperview().inset(Appereance.sideMargin)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(Appereance.bottomMargin)
        }
    }
}
