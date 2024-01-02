//
//  InvoiceItemView.swift
//  InvoiceManager
//
//  Created by Parth Chopra on 12/21/23.
//

import SwiftUI

struct InvoiceItemView: View {
    @StateObject var viewModel = InvoiceItemViewViewModel()
    let item: InvoiceItem
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.custom("Avenir", size: 18))
                    .bold()
                Text("\(Date(timeIntervalSince1970: item.date).formatted(date: .complete, time: .omitted))")
                    .font(.custom("Avenir", size: 14))
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button {
                viewModel.toggleIsSubmitted(item: item)
            } label: {
                Image(systemName: item.isSubmitted ? "checkmark.square.fill" : "square")
            }
            
        }
    }
}

struct InvoiceItemView_Previews: PreviewProvider {
    static var previews: some View {
        InvoiceItemView(item: .init(
            id: "123",
            title: "Milestones Richmond Hill",
            date: Date().timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            price: 45.67,
            numPeople: 3,
            description: "Dinner with Parth and Raj",
            tag: "Food",
            isSubmitted: false
        ))
    }
}
