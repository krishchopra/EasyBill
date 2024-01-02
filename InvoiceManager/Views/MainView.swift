//
//  ContentView.swift
//  InvoiceManager
//
//  Created by Krish Chopra on 2023-12-20.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn && !viewModel.currUserID.isEmpty {
            // display signed in view
            accountView
        } else {
            // display login view
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            InvoiceView(userID: viewModel.currUserID)
                .tabItem {
                    Label("home", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("profile", systemImage: "person.circle")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
