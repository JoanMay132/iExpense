//
//  ContentView.swift
//  iExpense
//
//  Created by Joan May on 18/10/24.
//

import SwiftUI
import Observation
// Day 36 Using @State with classes - !Expense SwiftUI

// Day 36 - Sharing SwiftUI state with @Observable

struct ExpenseItem4 : Identifiable, Codable, Equatable {
    var id : UUID = UUID()
    var name : String
    var type : String
    var amount : Double
}

@Observable
class Expenses4 {
    var items = [ExpenseItem4]() {
        // Here we store the data in the app (Day 37 - Making changes permanent with UserDefaults)
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    // This line is to separe diferent types of items
    var personalItems : [ExpenseItem4] {
        items.filter { $0.type == "Personal"}
    }
    var businessItems : [ExpenseItem4] {
        items.filter { $0.type == "Business"}
    }
    // -------------------------------------------
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem4].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}
struct ContentView: View {
    @State private var expenses = Expenses4()

    var body: some View {
        NavigationStack {
            List {
                ExpenseSection(title: "Business", expenses: expenses.businessItems, deleteItems: removeBusinessItems)
                ExpenseSection(title: "Personal", expenses: expenses.personalItems, deleteItems: removePersonalItems)
            }
            
            .navigationTitle("Expense!")
            .toolbar {
                NavigationLink {
                    AddView(expenses: expenses)
                } label : {
                    Label("Add Expense", systemImage: "plus")
                }
   
            }
     
        }
        
        
       
    }
    
    // Function to delete items
    func removeItems (offsets : IndexSet, in inputArray : [ExpenseItem4] ){
//        expenses.items.remove(atOffsets: offsets)
        var objectsToDelete = IndexSet()
        
        for offset in offsets {
            let item = inputArray[offset]
            
            if let index = expenses.items.firstIndex(of: item) {
                objectsToDelete.insert(index)
            }
        }
        expenses.items.remove(atOffsets: objectsToDelete)
    }
    
    func removePersonalItems(at offsets: IndexSet){
        removeItems(offsets: offsets, in: expenses.personalItems)
    }
    func removeBusinessItems(at offsets: IndexSet){
        removeItems(offsets: offsets, in: expenses.businessItems)
    }
}

#Preview {
    ContentView()
}
