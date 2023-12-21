//
//  InvoiceManagerApp.swift
//  InvoiceManager
//
//  Created by Krish Chopra on 2023-12-20.
//

import SwiftUI
import FirebaseCore

@main
struct InvoiceManagerApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
