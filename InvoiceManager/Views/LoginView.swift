//
//  LoginView.swift
//  InvoiceManager
//
//  Created by Parth Chopra on 12/21/23.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    
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
                    TextField("email", text: $email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .font(.custom("Avenir", size: 18))
                        .padding(.all, 2)
                    SecureField("password", text: $password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .font(.custom("Avenir", size: 18))
                        .padding(.all, 2)
                    
                    Button {
                        // user will attempt to login upon click
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
