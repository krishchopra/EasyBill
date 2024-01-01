//
//  NewInvoiceItemView.swift
//  InvoiceManager
//
//  Created by Parth Chopra on 12/21/23.
//

import SwiftUI

struct NewInvoiceItemView: View {
    @StateObject var viewModel = NewInvoiceItemViewViewModel()
    @Binding var newInvoiceItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("new expense")
                .font(.custom("Avenir", size: 32))
                .bold()
                .padding(.top)
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
                TextField("price ($)", value: $viewModel.price, format: .number)
                    .keyboardType(.decimalPad)
                    .font(.custom("Avenir", size: 18))
                // Num People
                TextField("num. of people", value: $viewModel.numPeople, format: .number)
                    .keyboardType(.numberPad)
                    .font(.custom("Avenir", size: 18))
                // Save Button
                Button {
                    if viewModel.canSave {
                        viewModel.save()
                        newInvoiceItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 50)
                            .foregroundColor(Color.teal)
                        Text("save")
                            .bold()
                            .foregroundColor(Color.white)
                            .font(.custom("Avenir", size: 18))
                    }
                }
                .padding(.all)
            }
            .alert(isPresented: $viewModel.showAlert, content: {
                Alert(
                    title: Text("Error"),
                    message: Text("Please fill in title, price, and number of people — and ensure that the date is today or in the past.")
                )
            })
        }
    }
}

struct NewInvoiceItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewInvoiceItemView(newInvoiceItemPresented: Binding(get: {
            return true
        }, set: { _ in
        }))
    }
}
