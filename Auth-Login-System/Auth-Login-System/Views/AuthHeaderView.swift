//
//  AuthHeaderView.swift
//  Auth-Login-System
//
//  Created by Ayberk Bilgiç on 26.01.2024.
//

import UIKit

class AuthHeaderView: UIView {

    // MARK: - UI Components
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        imageView.image = UIImage(named: "logo")
        
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 26, weight: .bold)
        label.text = ""
 
        return label
    }()
    
    private let subLabel: UILabel = {
        let subLabel = UILabel()
        subLabel.textColor = .secondaryLabel
        subLabel.textAlignment = .center
        subLabel.font = .systemFont(ofSize: 16, weight: .regular)
        
        
        return subLabel
    }()
    
    // MARK: - Lifecycle
    
    init(title: String, subTitle: String) {
        super.init(frame: .zero)
        self.setupUI()
        self.label.text = title
        self.subLabel.text = subTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup

    private func setupUI() {
        self.addSubview(imageView)
        self.addSubview(label)
        self.addSubview(subLabel)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
            self.imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.imageView.widthAnchor.constraint(equalToConstant: 70),
            self.imageView.heightAnchor.constraint(equalToConstant: 70),
            
        ])
        
    }
    
    
    
}
