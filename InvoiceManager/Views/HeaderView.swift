//
//  HeaderView.swift
//  InvoiceManager
//
//  Created by Parth Chopra on 12/21/23.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(Color.indigo)
                .rotationEffect(Angle(degrees: 20))
            VStack {
                Text("easybill")
                    .font(.custom(
                        "Avenir", fixedSize: 60))
                    .foregroundColor(Color.white)
                    .bold()
                    .padding(.bottom, -15)
                Text("track invoices with ease")
                    .font(.custom(
                        "Avenir", fixedSize: 20))
                    .foregroundColor(Color.white)
            }
            .padding(.bottom, 0)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 300)
        .offset(y: -20)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
