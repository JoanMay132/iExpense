//
//  AddView.swift
//  iExpense
//
//  Created by Joan May on 21/10/24.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var name = "New expense"
    @State private var type = "Personal"
    @State private var amount : Double = 0.0
    
    var expenses : Expenses4
    
    let types = ["Business", "Personal"]
    let localCurrency = Locale.current.currency?.identifier ?? "USD"
    var body: some View {
        
            Form {
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", value: $amount, format: .currency(code: localCurrency))
                    .keyboardType(.decimalPad)
                    
            }
            .navigationTitle($name)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let item = ExpenseItem4(name: name, type: type, amount: amount)
                        expenses.items.append(item)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", role: .cancel) {
                        dismiss()
                    }
                }
            }
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
        }
 
}

#Preview {
    AddView(expenses: Expenses4())
}
