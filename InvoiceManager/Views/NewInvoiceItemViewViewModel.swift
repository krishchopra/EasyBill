//
//  NewInvoiceItemViewViewModel.swift
//  InvoiceManager
//
//  Created by Parth Chopra on 12/21/23.
//

import Foundation

/// ViewModel for single invoice item view (each row in list of invoice items)
/// Primary tab
class NewInvoiceItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var description = ""
    @Published var tag = "" // "Food", "Entertainment", "Travel", etc
    @Published var date = Date()
    @Published var price: Double?
    @Published var numPeople: Int?
    @Published var showAlert = false
    
    init() {
        
    }
    
    func save() {
        
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty, !(price == nil), !(numPeople == nil) else {
            return false
        }
        
        guard date <= Date().addingTimeInterval(86400) else {
            return false
        }
        
        return true
    }
}
