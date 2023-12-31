//
//  NewInvoiceItemView.swift
//  InvoiceManager
//
//  Created by Parth Chopra on 12/21/23.
//

import SwiftUI

struct NewInvoiceItemView: View {
    @StateObject var viewModel = NewInvoiceItemViewViewModel()
    
    var body: some View {
        VStack {
            Text("new invoice")
                .font(.custom("Avenir", size: 32))
                .bold()
            // New invoice form
            Form {
                // Title
                TextField("title", text: $viewModel.title)
                    .font(.custom("Avenir", size: 18))
                    .bold()
                    .autocapitalization(.none)
                // Description
                TextField("description", text: $viewModel.description, axis: .vertical)
                    .lineLimit(5)
                    .font(.custom("Avenir", size: 18))
                    .autocapitalization(.none)
                // Date
                DatePicker("date", selection: $viewModel.date, displayedComponents: .date)
                    .font(.custom("Avenir", size: 18))
                    .foregroundColor(.gray.opacity(0.6))
                    .datePickerStyle(CompactDatePickerStyle())
                // Tag (dropdown of categories)
                Picker("tag", selection: $viewModel.tag) {
                    ForEach(Constants.businessExpenseCategories, id: \.self) { category in
                        Text(category.lowercased())
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .font(.custom("Avenir", size: 18))
                .foregroundColor(.gray.opacity(0.6))
                // Price
                TextField("price", value: $viewModel.price, formatter: NumberFormatter())
                    .keyboardType(.decimalPad)
                // Num People
                TextField("num. people", value: $viewModel.numPeople, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
            }
        }
    }
}

struct NewInvoiceItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewInvoiceItemView()
    }
}
