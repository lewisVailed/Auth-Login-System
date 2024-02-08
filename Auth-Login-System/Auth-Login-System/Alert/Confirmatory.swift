//
//  Confirmatory.swift
//  Auth-Login-System
//
//  Created by Ayberk Bilgiç on 8.02.2024.
//

import Foundation

class Confirmatory {
    
        public static func isValidEmail(for email: String) -> Bool {
            let email = email.trimmingCharacters(in: .whitespacesAndNewlines)
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.{1}[A-Za-z]{2,64}"
            let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
            return emailPred.evaluate(with: email)
        }
        
        public static func isValidUsername(for username: String) -> Bool {
            let username = username.trimmingCharacters(in: .whitespacesAndNewlines)
            let usernameRegEx = "\\w{4,24}"
            let usernamePred = NSPredicate(format: "SELF MATCHES %@", usernameRegEx)
            return usernamePred.evaluate(with: username)
        }
        
        public static func isValidPassword(for password: String) -> Bool {
            let password = password.trimmingCharacters(in: .whitespacesAndNewlines)
            let passwordRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[$@$#!%*?&]).{6,32}$"
            let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
            return passwordPred.evaluate(with: password)
        }
    
}
