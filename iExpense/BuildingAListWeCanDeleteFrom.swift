//
//  BuildingAListWeCanDeleteFrom.swift
//  iExpense
//
//  Created by Joan May on 21/10/24.
//

import SwiftUI
// DAY 37 - BUILDING A LIST WE CAN DELETE FROM
struct ExpenseItem {
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]()
}
struct BuildingAListWeCanDeleteFrom: View {
    @State private var expenses = Expenses()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items, id: \.name) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("!Expense")
            .toolbar {
                Button("Add expense", systemImage: "plus") {
                    let expense = ExpenseItem(name : "Text", type: "Personal", amount: 5)
                    expenses.items.append(expense)
                }
            }
            
        }
        
    }
    func removeItems(at offsets : IndexSet)
    {
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    BuildingAListWeCanDeleteFrom()
}
