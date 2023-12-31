//
//  LoginViewViewModel.swift
//  InvoiceManager
//
//  Created by Parth Chopra on 12/21/23.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject {
    typealias FirebaseAuthModule = FirebaseAuth.Auth
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() { 
        
    }
    
    func login() {
        guard validate() else {
            return
        }
        // Attempt to log user in using firebase
        FirebaseAuthModule.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool {
        // reset error message when called
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields!"
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter a valid email!"
            return false
        }
        return true
    }
}
