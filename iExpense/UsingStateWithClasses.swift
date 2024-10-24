//
//  UsingStateWithClasses.swift
//  iExpense
//
//  Created by Joan May on 22/10/24.
//

import SwiftUI
@Observable
class User4 {
    var firstName = "Joan"
    var lastName = "May"
}
struct UsingStateWithClasses: View {
    @State private var user = User4()
    @State private var name = ""
    var body: some View {
        
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
            TextField("Enter your name", text: $name)
        }
        .padding()
    }
}

#Preview {
    UsingStateWithClasses()
}
