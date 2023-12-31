//
//  User.swift
//  InvoiceManager
//
//  Created by Parth Chopra on 12/21/23.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
