//
//  InvoiceItem.swift
//  InvoiceManager
//
//  Created by Parth Chopra on 12/21/23.
//

import Foundation

struct InvoiceItem: Codable, Identifiable {
    let id: String
    let title: String
    let date: TimeInterval
    let createdDate: TimeInterval
    let price: Double?
    let numPeople: Int?
    let description: String?
    let tag: String?
    // var isSubmitted: Bool
    // consider changing to isReimbursed?
    
//    mutating func setDone(_ state: Bool) {
//        isSubmitted = state
//    }
}
