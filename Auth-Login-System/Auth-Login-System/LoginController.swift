//
//  LoginController.swift
//  Auth-Login-System
//
//  Created by Ayberk Bilgiç on 26.01.2024.
//

import UIKit

class LoginController: UIViewController {

    // MARK: - UI Components
    private let headerView = AuthHeaderView(title: "Sign In", subTitle: "Sign in to your account")
    private let usernameField = CustomTextField(fieldType: .username)
    private let passwordField = CustomTextField(fieldType: .password)
    private let signInButton = CustomButton(title: "Sign In", hasBackground: true, fontSize: .big)
    private let newUserButton = CustomButton(title: "New User? Create Account.", fontSize: .medium)
    private let forgotUserButton = CustomButton(title: "Forgot Password?", fontSize: .small)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        self.signInButton.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
        self.newUserButton.addTarget(self, action: #selector(didTapNewUserButton), for: .touchUpInside)
        self.forgotUserButton.addTarget(self, action: #selector(didTapForgotPasswordButton), for: .touchUpInside)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        
        self.didTapNewUserButton()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        self.view.addSubview(headerView)
        self.view.addSubview(usernameField)
        self.view.addSubview(passwordField)
        self.view.addSubview(signInButton)
        self.view.addSubview(newUserButton)
        self.view.addSubview(forgotUserButton)
        
        self.view.backgroundColor = .systemBackground
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        newUserButton.translatesAutoresizingMaskIntoConstraints = false
        forgotUserButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 260),
        
            self.usernameField.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            self.usernameField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.usernameField.heightAnchor.constraint(equalToConstant: 55),
            self.usernameField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),

            self.passwordField.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 20),
            self.passwordField.centerXAnchor.constraint(equalTo: usernameField.centerXAnchor),
            self.passwordField.heightAnchor.constraint(equalToConstant: 55),
            self.passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.signInButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 20),
            self.signInButton.centerXAnchor.constraint(equalTo: passwordField  .centerXAnchor),
            self.signInButton.heightAnchor.constraint(equalToConstant: 55),
            self.signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.newUserButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 10),
            self.newUserButton.centerXAnchor.constraint(equalTo: signInButton.centerXAnchor),
            self.newUserButton.heightAnchor.constraint(equalToConstant: 44),
            self.newUserButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.forgotUserButton.topAnchor.constraint(equalTo: newUserButton.bottomAnchor, constant: 5),
            self.forgotUserButton.centerXAnchor.constraint(equalTo: newUserButton.centerXAnchor),
            self.forgotUserButton.heightAnchor.constraint(equalToConstant: 44),
            self.forgotUserButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
        ])
        
       
    }
    
    // MARK: - Selector
    
    @objc func didTapSignInButton() {
        let vc = HomeController()
        vc.modalPresentationStyle = .fullScreen
        self .present(vc, animated: false, completion: nil)
    }
    
    @objc func didTapNewUserButton() {
        let vc = RegisterController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func didTapForgotPasswordButton() {
        let vc = ForgotPasswordController ()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
