//
//  StoringUserSettings.swift
//  iExpense
//
//  Created by Joan May on 21/10/24.
//

// Day 36 - STORING USER SETTINGS WITH USERDEFAULTS
import SwiftUI

struct StoringUserSettings: View {
    
//    @State private var tapCount : Int = 0
//    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    @AppStorage("tapCount") private var tapCount = 0
    var body: some View {
        Button("Tap Count : \(tapCount)") {
            tapCount += 1
            

        }
    }
}

#Preview {
    StoringUserSettings()
}
