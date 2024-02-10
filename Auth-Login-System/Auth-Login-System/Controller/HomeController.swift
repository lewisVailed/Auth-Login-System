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
    
    private let labelTwo: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.text = "Loading"
 
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        imageView.image = UIImage(named: "logo")
        
        return imageView
    }()
    
    private let textView: UITextView = {
        let textView = UITextView()
        textView.text = "It's good to see you coming. Stay tuned for the coffee recipes service we will offer in our application in the future."
        textView.textColor = .label
        textView.backgroundColor = .clear
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    private let textViewTwo: UITextView = {
        let textView = UITextView()
        textView.text = "To improve user experience, you can contact me through my LinkedIn profile. Stay happy :)"
        textView.textColor = .label
        textView.backgroundColor = .clear
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
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
                self.title = "Coffee Bird"
                
                self.label.text = "Welcome back 🖐🏻 \(user.username)"
                self.labelTwo.text = "\(user.email)\n\(user.userUID)"
                
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let loader = self.loader()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.stopLoader(with: loader)
        }
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        self.view.addSubview(label)
        self.view.addSubview(imageView)
        self.view.addSubview(textView)
        self.view.addSubview(textViewTwo)
        self.view.addSubview(labelTwo)
        self.view.backgroundColor = .systemBackground
        label.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        textViewTwo.translatesAutoresizingMaskIntoConstraints = false
        labelTwo.translatesAutoresizingMaskIntoConstraints = false
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(didTapLogoutButton))
        
        NSLayoutConstraint.activate([
            
            self.imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.imageView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant: 30),
            self.imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.imageView.widthAnchor.constraint(equalToConstant: 100),
            self.imageView.heightAnchor.constraint(equalToConstant: 100),
            
            self.label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            self.label.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            self.label.heightAnchor.constraint(equalToConstant: 55),
            self.label.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.textView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            self.textView.centerXAnchor.constraint(equalTo: label.centerXAnchor),
            self.textView.heightAnchor.constraint(equalToConstant: 55),
            self.textView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.textViewTwo.topAnchor.constraint(equalTo: textView.bottomAnchor),
            self.textViewTwo.centerXAnchor.constraint(equalTo: textView.centerXAnchor),
            self.textViewTwo.heightAnchor.constraint(equalToConstant: 55),
            self.textViewTwo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.labelTwo.topAnchor.constraint(equalTo: textViewTwo.bottomAnchor, constant: 150),
            self.labelTwo.centerXAnchor.constraint(equalTo: textViewTwo.centerXAnchor),
            self.labelTwo.heightAnchor.constraint(equalToConstant: 55),
            self.labelTwo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
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

extension HomeController {
    func loader() -> UIAlertController {
        let alert = UIAlertController(title: nil, message: "Please wait", preferredStyle: .alert)
        let indicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        indicator.hidesWhenStopped = true
        indicator.startAnimating()
        indicator.style = .large
        alert.view.addSubview(indicator)
        present(alert, animated: true, completion: nil)
        
        return alert
    }
    
    func stopLoader(with loader: UIAlertController) {
        DispatchQueue.main.async {
            loader.dismiss(animated: true, completion: nil)
        }
    }
    
}
