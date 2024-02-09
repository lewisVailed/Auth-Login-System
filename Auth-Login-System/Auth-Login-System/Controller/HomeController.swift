//
//  HomeController.swift
//  Auth-Login-System
//
//  Created by Ayberk Bilgiç on 26.01.2024.
//

import UIKit

class HomeController: UIViewController {

    // MARK: - UI Components
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        label.text = "Loading"
 
        return label
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        AuthService.shared.fetchUser { [weak self] user, error in
            guard let self = self else { return }
            
            if let error = error {
                AlertManager.showFetchingUserErrorAlert(on: self, with: error)
                return
            }
            
            if let user = user {
                self.label.text = "\(user.username)\n\(user.email)"
            }
        }
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        self.view.addSubview(label)
        self.view.backgroundColor = .systemBackground
        label.translatesAutoresizingMaskIntoConstraints = false
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(didTapLogoutButton))
        
        NSLayoutConstraint.activate([
            self.label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        
        ])
        
    }
    
    // MARK: - Selector
    @objc private func didTapLogoutButton() {
        AuthService.shared.signOut { [weak self] error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showLogoutErrorAlert(on: self, with: error)
                return
            }
            
            if let sceneDelegete = self.view.window?.windowScene?.delegate as? SceneDelegate {
                sceneDelegete.checkAuthentication()
            }
        }
    }
    

}
