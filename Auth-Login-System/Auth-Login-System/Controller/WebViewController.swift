//
//  WebViewController.swift
//  Auth-Login-System
//
//  Created by Ayberk Bilgiç on 1.02.2024.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    // MARK: - UI Components
    private let urlString: String
    private let webView = WKWebView()
    
    init(with urlString: String) {
        self.urlString = urlString
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        guard let url = URL(string: urlString) else {
            self.dismiss(animated: true, completion: nil)
            return
        }
        
        self.webView.load(URLRequest(url: url))
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapDoneButton))
        self.navigationController?.navigationBar.backgroundColor = .secondarySystemBackground
        self.view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.webView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.webView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.webView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.webView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        ])
        
    }
   
                                                                 
    // MARK: - Selector
    @objc private func didTapDoneButton() {
        self.dismiss(animated: true, completion: nil)
    }

}
