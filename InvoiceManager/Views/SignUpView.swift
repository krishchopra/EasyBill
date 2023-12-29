//
//  SignUpView.swift
//  InvoiceManager
//
//  Created by Parth Chopra on 12/21/23.
//

import SwiftUI

struct SignUpView: View {
    
    @State var name = ""
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            HeaderView(title: "register",
                       subtitle: "begin your easybill journey",
                       angle: -20,
                       background: .teal)
            .padding(.top, 8)
            .offset(y: -20)
            
            Form {
                TextField("full name", text: $name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                    .font(.custom("Avenir", size: 18))
                    .padding(.all, 2)
                TextField("email", text: $email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
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
                            .foregroundColor(Color.mint)
                        Text("sign up")
                            .bold()
                            .foregroundColor(Color.white)
                            .font(.custom("Avenir", size: 18))
                    }
                }
                .padding(.top)
            }
            .scrollContentBackground(.hidden)
            .padding(.top, 8)
            
            Spacer()
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
