//
//  SharingAnObservedObject.swift
//  iExpense
//
//  Created by Joan May on 21/10/24.
//
import Observation
import SwiftUI
// DAY 37 - SHARING AN OBSERVED OBJECT WITH A NEW VIEW

struct ExpenseItem3 : Identifiable {
    let id : UUID = UUID()
    let name : String
    let item : String
    let amount : Double
    
}

@Observable
class Expenses3 {
    var items = [ExpenseItem3]()
}
struct SharingAnObservedObject: View {
    @State private var showingAddExpense = false
    
    @State private var expenses = Expenses3()
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                        Text(item.name)
                }
            }
            .navigationTitle("!Expense")
            .toolbar {
                Button("Add item", systemImage: "plus") {
                    showingAddExpense = true
                    
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                // Show an Addview here
//                AddView(expenses: expenses3)
            }
    
        }
    }
}

#Preview {
    SharingAnObservedObject()
}
