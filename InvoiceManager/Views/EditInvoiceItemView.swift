//
//  EditInvoiceItemView.swift
//  InvoiceManager
//
//  Created by Krish Chopra on 2024-01-03.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

struct EditInvoiceItemView: View {
    @StateObject var viewModel: EditInvoiceItemViewViewModel
    @Binding var editedInvoiceItemPresented: Bool
    
    init(invoiceID: String, editedInvoiceItemPresented: Binding<Bool>) {
        self._viewModel = StateObject(
            wrappedValue: EditInvoiceItemViewViewModel(invoiceID: invoiceID)
        )
        self._editedInvoiceItemPresented = editedInvoiceItemPresented
    }
    
    var body: some View {
        VStack {
            Text("edit expense")
                .font(.custom("Avenir", size: 32))
                .bold()
                .padding(.top)
            // New invoice form
            Form {
                // Title
                TextField("location/title", text: $viewModel.title)
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
                    if viewModel.canUpdate {
                        viewModel.update()
                        editedInvoiceItemPresented = false
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
                    message: Text("Please fill in a valid title, price, and number of people — and ensure that the date is today or in the past.")
                )
            })
            .onAppear {
                viewModel.loadData()
            }
        }
    }
}

struct EditInvoiceItemView_Previews: PreviewProvider {
    static var previews: some View {
        EditInvoiceItemView(invoiceID: "4ECA6CF8-4D63-4BCA-B3B5-C20837AEA3D9", editedInvoiceItemPresented: Binding(get: {
            return true
        }, set: { _ in
        }))
    }
}
