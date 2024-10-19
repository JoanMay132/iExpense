//
//  DeletingUsingOnDelete.swift
//  iExpense
//
//  Created by Joan May on 18/10/24.
//

import SwiftUI
// Day 36 - Deleting Items using on Delete
struct DeletingUsingOnDelete: View {
    
    @State private var numbers : [Int] = []
    @State private var currentNumber : Int = 1
   var body: some View {
       NavigationStack {
           VStack {
               List {
                   ForEach(numbers, id: \.self) { number in
                       Text("Row \(number)")
                   }
                   .onDelete(perform: deleteItems)
               }
               Button("Add number") {
                   numbers.append(currentNumber)
                   currentNumber += 1
               }
           }
           
            .toolbar {
                if !numbers.isEmpty {
                    EditButton()
                }
                
            }
        }
    }
    func deleteItems (offsets : IndexSet ){
        numbers.remove(atOffsets: offsets)
    }
}

#Preview {
    DeletingUsingOnDelete()
}
