//
//  ProfileView.swift
//  InvoiceManager
//
//  Created by Parth Chopra on 12/21/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading Profile...")
                        .foregroundColor(.indigo)
                        .font(.custom("Avenir", size: 24))
                        .bold()
                        .padding(.bottom, 70)
                    
                }
            }
            .navigationTitle("My Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.indigo)
            .frame(width: 125, height: 125)
            .padding(30)
        
        // Info: Name, Email, Member Since
        VStack(alignment: .leading) {
            HStack {
                Text("name:")
                    .font(.custom("Avenir", size: 19))
                    .bold()
                Text(user.name)
                    .font(.custom("Avenir", size: 19))
            }
            .padding(10)
            HStack {
                Text("email:")
                    .font(.custom("Avenir", size: 19))
                    .bold()
                Text(user.email)
                    .font(.custom("Avenir", size: 19))
            }
            .padding(10)
            HStack {
                Text("member since:")
                    .font(.custom("Avenir", size: 19))
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                    .font(.custom("Avenir", size: 19))
            }
            .padding(10)
        }
        .padding(.bottom)
        
        // Sign Out
        Button {
            viewModel.logOut()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 50)
                    .foregroundColor(Color.red)
                    .frame(width: 150, height: 50)
                Text("log out")
                    .bold()
                    .foregroundColor(Color.white)
                    .font(.custom("Avenir", size: 18))
            }
        }
        .padding()
        Spacer()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
