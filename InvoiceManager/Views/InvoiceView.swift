//
//  InvoiceItemsView.swift
//  InvoiceManager
//
//  Created by Parth Chopra on 12/21/23.
//

import SwiftUI

struct InvoiceView: View {
    @StateObject var viewModel = InvoiceViewViewModel()
    
    private let userID: String
    
    init(userID: String) {
        self.userID = userID
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle("Expense List")
            .toolbar {
                Button {
                    viewModel.showingNewInvoiceItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewInvoiceItemView, content: {
                NewInvoiceItemView(newInvoiceItemPresented: 
                                    $viewModel.showingNewInvoiceItemView)
            })
        }
    }
}

struct InvoiceView_Previews: PreviewProvider {
    static var previews: some View {
        InvoiceView(userID: "")
    }
}
