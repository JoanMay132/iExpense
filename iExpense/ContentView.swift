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
@Observable
class User {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}
struct ContentView: View {
    @State private var user = User()
    @State private var name : String = ""
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
            TextField("Enter your name", text: $name)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
