//
//  InvoiceItemView.swift
//  InvoiceManager
//
//  Created by Parth Chopra on 12/21/23.
//

import SwiftUI
import FirebaseAuth

struct InvoiceItemView: View {
    @StateObject var viewModel = InvoiceItemViewViewModel()
    
    let item: InvoiceItem
    private var p: Double {
        ((item.price ?? 0.0) * 100).rounded() / 100 / Double(item.numPeople ?? 1)
    }
    private var pricePerPerson: String {
        if (item.numPeople ?? 1) > 1 {
            return " ($\((p * 100).rounded() / 100) per person)"
        } else {
            return ""
        }
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.custom("Avenir", size: 18))
                    .bold()
                Text("$" + String(((item.price ?? 0.0) * 100).rounded() / 100) + pricePerPerson)
                    .font(.custom("Avenir", size: 18))
                    .bold()
                Text(item.description ?? "")
                    .font(.custom("Avenir", size: 14))
                Text("\(item.tag ?? "") for \(item.numPeople ?? 0)")
                    .font(.custom("Avenir", size: 14))
                    .italic()
                Text("\(Date(timeIntervalSince1970: item.date).formatted(date: .complete, time: .omitted))")
                    .font(.custom("Avenir", size: 14))
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
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
            tag: "Food"
        ))
    }
}
