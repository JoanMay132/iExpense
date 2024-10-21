//
//  ArchivingSwiftObjectsWithCodable.swift
//  iExpense
//
//  Created by Joan May on 21/10/24.
//

import SwiftUI
// Day 36 - Archiving Swift Objects with Codable

struct User2 : Codable {
    let firstName : String
    let lastName : String
}
struct ArchivingSwiftObjectsWithCodable: View {
    @State private var user = User2(firstName: "Taylor", lastName: "Swift")
    var body: some View {
        Button("Save User " ) {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(user){
                UserDefaults.standard.set(data, forKey: "user")
            }
        }
    }
}

#Preview {
    ArchivingSwiftObjectsWithCodable()
}
