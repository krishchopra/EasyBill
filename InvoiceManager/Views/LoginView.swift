//
//  LoginView.swift
//  InvoiceManager
//
//  Created by Parth Chopra on 12/21/23.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                // Header
                HeaderView(title: "easybill",
                           subtitle: "track invoices with ease",
                           angle: 20,
                           background: .indigo)
                
                // Login Form
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                            .font(.custom("Avenir", size: 18))
                    }
                    TextField("email", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                        .font(.custom("Avenir", size: 18))
                        .padding(.all, 2)
                    SecureField("password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .font(.custom("Avenir", size: 18))
                        .padding(.all, 2)
                    
                    Button {
                        viewModel.login()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 50)
                                .foregroundColor(Color.indigo)
                            Text("login")
                                .bold()
                                .foregroundColor(Color.white)
                                .font(.custom("Avenir", size: 18))
                        }
                    }
                    .padding(.top)
                }
                .scrollContentBackground(.hidden)
                .padding(.top, 8)
                
                // Create Account / Sign Up
                VStack {
                    Text("don't have an account?")
                        .font(.custom("Avenir", size: 18))
                    NavigationLink(destination: SignUpView(), label: {
                        Text("sign up here")
                            .font(.custom("Avenir", size: 18))
                            .underline()
                    })
                }
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
