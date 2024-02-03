//
//  AlertManager.swift
//  Auth-Login-System
//
//  Created by Ayberk Bilgiç on 2.02.2024.
//

import UIKit

class AlertManager {
    private static func showAlert(on vc: UIViewController, title: String, message: String?) {
        
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            vc.present(alert, animated: true)
        }
    }
    
    
}

// MARK: - Message for Alert
extension AlertManager {
    
    // MARK: - Show Validation Alert
    public static func showInvalidEmailAlert(on vc: UIViewController) {
        self.showAlert(on: vc, title: "Invalid Email", message: "Please enter a valid email")
    }
    
    public static func showInvalidPasswordAlert(on vc: UIViewController) {
        self.showAlert(on: vc, title: "Invalid Password", message: "Please enter a valid password")
    }
    
    public static func showInvalidUsernameAlert(on vc: UIViewController) {
        self.showAlert(on: vc, title: "Invalid Username", message: "Please enter a valid username")
    }
    
    
    // MARK: - Registration Errors
    public static func showRegistrationErrorAlert(on vc: UIViewController) {
        self.showAlert(on: vc, title: "Unknown Registration Error", message: nil)
    }
    
    public static func showRegistrationErrorAlert(on vc: UIViewController, with error: Error) {
        self.showAlert(on: vc, title: "Unknown Registration Error", message: "\(error.localizedDescription)")
    }
    
    
    // MARK: - Login Errors
    public static func showSignInErrorAlert(on vc: UIViewController) {
        self.showAlert(on: vc, title: "Unknown Signing In Error", message: nil)
    }
    
    public static func showSignInErrorAlert(on vc: UIViewController, with error: Error) {
        self.showAlert(on: vc, title: "Signing In Error", message: "\(error.localizedDescription)")
    }
    
    
    // MARK: - Logout Errors
    public static func showLogoutErrorAlert(on vc: UIViewController, with error: Error) {
        self.showAlert(on: vc, title: "Unknown Logout Error", message: "\(error.localizedDescription)")
    }
    
    
    // MARK: - Forgot Password Errors
    public static func showPasswordResetSent(on vc: UIViewController) {
        self.showAlert(on: vc, title: "Password Reset Sent", message: nil)
    }
    
    public static func showSendingPasswordResetErrorAlert(on vc: UIViewController, with error: Error) {
        self.showAlert(on: vc, title: "Sending Password Reset Error", message: "\(error.localizedDescription)")
    }
    
    
    // MARK: - Fetching User Errors
    public static func showUnknownFetchingUserErrorAlert(on vc: UIViewController) {
        self.showAlert(on: vc, title: "Unknown Fetching User Error", message: nil)
    }
    
    public static func showFetchingUserErrorAlert(on vc: UIViewController, with error: Error) {
        self.showAlert(on: vc, title: "Fetching User Error", message: "\(error.localizedDescription)")
    }
}
