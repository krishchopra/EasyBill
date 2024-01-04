//
//  NewInvoiceItemViewViewModel.swift
//  InvoiceManager
//
//  Created by Parth Chopra on 12/21/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

/// ViewModel for single invoice item view (each row in list of invoice items)
/// Primary tab
class NewInvoiceItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var description = ""
    // NOTE: Add a default here since the Picker component gets upset otherwise and throws an error
    @Published var tag = "Food" // "Food", "Entertainment", "Travel", etc
    @Published var date = Date()
    @Published var price: Double?
    @Published var numPeople: Int?
    @Published var showAlert = false
    
    init() {
        
    }
    
    func save() {
        guard canSave else {
            return
        }
        
        // Get current user ID
        guard let uID = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Create model
        let newID = UUID().uuidString
        let newInvoiceItem = InvoiceItem(
            id: newID,
            title: title,
            date: date.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            price: price,
            numPeople: numPeople,
            description: description,
            tag: tag)
        
        // Save model
        let database = Firestore.firestore()
        
        database.collection("users")
            .document(uID)
            .collection("expenses")
            .document(newID)
            .setData(newInvoiceItem.asDict())
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty, (price ?? 0) > 0, (numPeople ?? 0) >= 1 else {
            return false
        }
        
        guard date <= Date().addingTimeInterval(86400) else {
            return false
        }
        
        return true
    }
}
