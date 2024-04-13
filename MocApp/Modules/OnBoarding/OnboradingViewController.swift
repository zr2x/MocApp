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
    static let space: CGFloat = 15
}

class OnboradingViewController: UIViewController {
    
    var viewModel: OnboardingViewModel
    
    private let skipRegistrationButton: UIButton = {
        let button = UIButton()
        button.setTitle("Позже", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(nil, action: #selector(registrationDidTapped), for: .touchUpInside)
        return button
    }()
    
    private let registrationButton: UIButton = {
        let button = UIButton()
        button.setTitle("Регистрация", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.addTarget(nil, action: #selector(registrationDidTapped), for: .touchUpInside)
        return button
    }()
    
    init(viewModel: OnboardingViewModel) {
        
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .orange
        addViews()
        setupConstraints()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    // MARK: - Action
    
    @objc private func registrationDidTapped() {
        viewModel.registrationButtonDidTapped()
    }
    
    @objc private func skipRegistrationDidTapped() {
        viewModel.skipRegistrationButtonDidTapped()
    }
    
    // MARK: - Layout
    
    private func addViews() {
        view.addSubview(registrationButton)
        view.addSubview(skipRegistrationButton)
    }
    
    private func setupConstraints() {
        
        registrationButton.snp.makeConstraints { make in
            make.height.equalTo(Appereance.buttonHeight)
            make.leading.trailing.equalToSuperview().inset(Appereance.sideMargin)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(Appereance.bottomMargin)
        }
        
        skipRegistrationButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(Appereance.sideMargin)
            make.height.equalTo(Appereance.buttonHeight)
            make.bottom.equalTo(registrationButton.snp.top).inset(-Appereance.space)
        }
    }
}
