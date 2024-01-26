//
//  LoginController.swift
//  Auth-Login-System
//
//  Created by Ayberk Bilgiç on 26.01.2024.
//

import UIKit

class LoginController: UIViewController {

    // MARK: - UI Components
    let headerView = AuthHeaderView(title: "Sign In", subTitle: "Sign in to your account")
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()

    }
    
    // MARK: - UI Setup
    private func setupUI() {
        self.view.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 270)
        
        
        ])
        
        
    }
    

}
