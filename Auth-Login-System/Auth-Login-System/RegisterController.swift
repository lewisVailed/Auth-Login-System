//
//  RegisterController.swift
//  Auth-Login-System
//
//  Created by Ayberk Bilgiç on 26.01.2024.
//

import UIKit

class RegisterController: UIViewController {
    
    // MARK: - UI Components
    private let headerView = AuthHeaderView(title: "Sign Up", subTitle: "Create your account")
    private let usernameField = CustomTextField(fieldType: .username)
    private let emailField = CustomTextField(fieldType: .email)
    private let passwordField = CustomTextField(fieldType: .password)
    
    private let signUpButton = CustomButton(title: "Sign Up", hasBackground: true, fontSize: .big )
    private let signInButton = CustomButton(title: "Already have an account? Sign In.", fontSize: .medium)
    
    private let termsTextView: UITextView = {
        let textView = UITextView()
        textView.text = "By creating an account, you agree to our Terms & Conditions and you acknowledge that you have read our Privacy Policy"
        textView.textColor = .label
        textView.backgroundColor = .clear
        textView.isEditable = false
        textView.isSelectable = true
        textView.isScrollEnabled = false
        return textView
    }()
    
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        self.signUpButton.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
        self.signInButton.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        
        
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        self.view.addSubview(headerView)
        self.view.addSubview(usernameField)
        self.view.addSubview(emailField)
        self.view.addSubview(passwordField)
        self.view.addSubview(signUpButton)
        self.view.addSubview(signInButton)
        self.view.addSubview(termsTextView)
        
        self.view.backgroundColor = .systemBackground
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        emailField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        termsTextView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
        
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 260),
        
            self.usernameField.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            self.usernameField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.usernameField.heightAnchor.constraint(equalToConstant: 55),
            self.usernameField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.emailField.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 20),
            self.emailField.centerXAnchor.constraint(equalTo: usernameField.centerXAnchor),
            self.emailField.heightAnchor.constraint(equalToConstant: 55),
            self.emailField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),

            self.passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 20),
            self.passwordField.centerXAnchor.constraint(equalTo: emailField.centerXAnchor),
            self.passwordField.heightAnchor.constraint(equalToConstant: 55),
            self.passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.signUpButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 20),
            self.signUpButton.centerXAnchor.constraint(equalTo: passwordField.centerXAnchor),
            self.signUpButton.heightAnchor.constraint(equalToConstant: 55),
            self.signUpButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.termsTextView.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 5),
            self.termsTextView.centerXAnchor.constraint(equalTo: signUpButton.centerXAnchor),
            self.termsTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.signInButton.topAnchor.constraint(equalTo: termsTextView.bottomAnchor, constant: 10),
            self.signInButton.centerXAnchor.constraint(equalTo: termsTextView.centerXAnchor),
            self.signInButton.heightAnchor.constraint(equalToConstant: 55),
            self.signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
        ])
        
       
    }
    
    // MARK: - Selector
    
    @objc func didTapSignInButton() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func didTapSignUpButton() {
        let vc = RegisterController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

    

}
