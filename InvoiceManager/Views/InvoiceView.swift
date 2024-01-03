//
//  InvoiceItemsView.swift
//  InvoiceManager
//
//  Created by Parth Chopra on 12/21/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct InvoiceView: View {
    @StateObject var viewModel: InvoiceViewViewModel
    @FirestoreQuery var items: [InvoiceItem]
    
    init(userID: String) {
        self._items = FirestoreQuery(
            collectionPath: "users/\(userID)/expenses")
        self._viewModel = StateObject(
            wrappedValue: InvoiceViewViewModel(userID: userID)
        )
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    InvoiceItemView(item: item)
                        .swipeActions {
                            Button {
                                viewModel.delete(id: item.id)
                            } label: {
                                Text("delete")
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .padding(.top, 10)
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
        InvoiceView(userID: "i4GxRU60IaRCJUuK7YtsqtQGOIc2")
    }
}
