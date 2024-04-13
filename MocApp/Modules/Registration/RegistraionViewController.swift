//
//  RegistraionViewController.swift
//  MocApp
//
//  Created by Искандер Ситдиков on 31.03.2024.
//

import UIKit
import SnapKit


class RegistraionViewController: UIViewController {
    
    private let viewModel: RegistrationViewModel

    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        textField.placeholder = "Введите email"
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        textField.placeholder = "Введите пароль"
        return textField
    }()
    
    private let registrationButton: UIButton = {
        let button = UIButton()
        button.setTitle("Зарегистрироваться", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.addTarget(nil, action: #selector(registrationButtonDidTapped), for: .touchUpInside)
        return button
    }()
    
    private let skipRegistrationButton: UIButton = {
        let button = UIButton()
        button.setTitle("Позже", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        return button
    }()
    
    
    init(viewModel: RegistrationViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        addViews()
        configureViews()
    }
    
    private func addViews() {
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(registrationButton)
        view.addSubview(skipRegistrationButton)
    }
    
    private func configureViews() {

        emailTextField.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(40)
            make.centerX.equalTo(view.center.x)
            make.centerY.equalTo(view.center.y)
        }

        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(15)
            make.height.equalTo(40)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        registrationButton.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
        
        skipRegistrationButton.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.bottom.equalTo(registrationButton.snp.top).offset(-15)
        }
    }
    
    // TODO: Validation textField

    
    //MARK: Action
    
    @objc private func registrationButtonDidTapped() {
        viewModel.registrationDidTapped()
    }
}
