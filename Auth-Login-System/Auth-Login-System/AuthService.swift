//
//  AuthService.swift
//  Auth-Login-System
//
//  Created by Ayberk Bilgiç on 4.02.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthService {
    
    public static let shared = AuthService()
    
    private init() {}
    
    
    /// A method to register the user
    /// - Parameters:
    ///   - UserRequest: The users information
    ///   - completion: Two values (bool, error)
    ///   - Bool: was registered - Determines if the user was registered and saved in the database correctly
    ///   - Error?:  An optional error if firebase provides once
    public func registerUser(with UserRequest: RegisterUserRequest, completion: @escaping (Bool, Error?) -> Void) {
        let username = UserRequest.username
        let email = UserRequest.email
        let password = UserRequest.password
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(false, error)
                return
            }
            
            guard let resultUser = result?.user else {
                completion(false, nil)
                return
            }
            
            let database = Firestore.firestore()
            database.collection("users")
                .document(resultUser.uid)
                .setData([
                    "username": username,
                    "email": email,
                ]) { error in
                    if let error = error {
                        completion(false, error)
                        return
                    }
                    completion(true, nil)
                }
            
            
        }
    }
    
}
