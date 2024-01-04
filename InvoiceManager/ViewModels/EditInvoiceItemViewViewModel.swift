//
//  EditInvoiceItemViewViewModel.swift
//  InvoiceManager
//
//  Created by Krish Chopra on 2024-01-03.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class EditInvoiceItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var description = ""
    @Published var tag = "Food"
    @Published var date = Date()
    @Published var price: Double?
    @Published var numPeople: Int?
    @Published var showAlert = false
    
    private let invoiceID: String
    
    init(invoiceID: String) {
        self.invoiceID = invoiceID
        loadData()
    }
    
    func loadData() {
        // Get the current user
        guard let userID = Auth.auth().currentUser?.uid else {
            return
        }
        // Fetch the item data and populate the view model
        let database = Firestore.firestore()
        
        database.collection("users")
            .document(userID)
            .collection("expenses")
            .document(invoiceID)
            .getDocument { [weak self] document, error in
                guard let self = self, let document = document, document.exists else {
                    return
                }
                
                if let invoiceItem = try? document.data(as: InvoiceItem.self) {
                    self.title = invoiceItem.title
                    self.description = invoiceItem.description ?? ""
                    self.tag = invoiceItem.tag ?? "Food"
                    self.date = Date(timeIntervalSince1970: invoiceItem.date)
                    self.price = invoiceItem.price
                    self.numPeople = invoiceItem.numPeople
                }
            }
    }
    
    func update() {
        guard canUpdate else {
            return
        }
        
        // Get current user ID
        guard let uID = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Create model
        let invoiceItemID = self.invoiceID
        
        let updatedInvoiceitem = InvoiceItem(
            id: invoiceItemID,
            title: title,
            date: date.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            price: price,
            numPeople: numPeople,
            description: description,
            tag: tag,
            isSubmitted: false
        )
        
        // Save updated item in db
        let database = Firestore.firestore()
        
        database.collection("users")
            .document(uID)
            .collection("expenses")
            .document(invoiceItemID)
            .updateData(updatedInvoiceitem.asDict())
    }
    
    var canUpdate: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty, (price ?? 0) > 0, (numPeople ?? 0) >= 1 else {
            return false
        }
        
        guard date <= Date().addingTimeInterval(86400) else {
            return false
        }
        
        return true
    }
}


