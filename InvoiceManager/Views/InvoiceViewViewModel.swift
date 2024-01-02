//
//  InvoiceViewViewModel.swift
//  InvoiceManager
//
//  Created by Parth Chopra on 12/21/23.
//

import Foundation
import FirebaseFirestore

class InvoiceViewViewModel: ObservableObject {
    @Published var showingNewInvoiceItemView = false
    
    private let userID: String
    
    init(userID: String) {
        self.userID = userID
    }
    
    
    /// Delete invoice item
    /// - Parameter id: Invoice item ID to delete
    func delete(id: String) {
        let database = Firestore.firestore()
        
        database.collection("users")
            .document(userID)
            .collection("expenses")
            .document(id)
            .delete()
    }
}
