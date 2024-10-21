//
//  IdentifiableItemsInSwiftUI.swift
//  iExpense
//
//  Created by Joan May on 21/10/24.
//

import SwiftUI
struct ExpenseItem2 : Identifiable {
    let id : UUID = UUID()
    let name : String
    let item : String
    let amount : Double
}

@Observable
class Expenses2 {
    var items = [ExpenseItem2]()
}
struct IdentifiableItemsInSwiftUI: View {
    @State private var expenses = Expenses2()
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                        Text(item.name)
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("!Expense")
            .toolbar {
                Button("Add expense", systemImage: "plus"){
                    let expense = ExpenseItem2(name: "Coca", item: "Coca Cola", amount: 10.0)
                    expenses.items.append(expense)
                }
            }
        }
    }
    func deleteItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}


#Preview {
    IdentifiableItemsInSwiftUI()
}
