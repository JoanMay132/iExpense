//
//  Showing&HidingViews.swift
//  iExpense
//
//  Created by Joan May on 18/10/24.
//

import SwiftUI
// Day 36
// Steps :
//  1. Create a button call show sheet to direct to another view
//  2. Print a text Hello, + name
//  3. Adding a dismmis botton

struct SheetView : View {
    @Environment(\.dismiss) var dismiss
    let name : String
    var body: some View {
        Text("Hello, \(name)")
        Text("Second view ")
        Button("Dismiss") {
            dismiss()
        }
    }
}
struct Showing_HidingViews: View {

    @State private var showingSheet = false
    var body: some View {
        Button("Show sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet, content: {
            SheetView(name: "@JoanMay132")
        })
    }
}

#Preview {
    Showing_HidingViews()
}
