//
//  MainViewViewModel.swift
//  InvoiceManager
//
//  Created by Parth Chopra on 12/21/23.
//

import Foundation
import FirebaseAuth

class MainViewViewModel: ObservableObject {
    typealias FirebaseAuthModule = FirebaseAuth.Auth
    
    @Published var currUserID: String = ""
    private var handler: FirebaseAuth.AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = FirebaseAuthModule.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currUserID = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        return FirebaseAuthModule.auth().currentUser != nil
    }
}
