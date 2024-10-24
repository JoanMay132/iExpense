//
//  ValueStyles.swift
//  iExpense
//
//  Created by Joan May on 23/10/24.
//

// Challenge here is adding styles to our items
import SwiftUI

extension View {
    func amountStyle (for item: ExpenseItem4) -> some View {
        var font : Font = .body
        var colorText : Color = .primary
        if item.amount < 10 {
            font = .body
            colorText = .yellow
        }else if item.amount < 100{
            font = .title3
        }else {
            font = .title
        }
        return self
            .font(font)
            .foregroundColor(colorText)
    }
    
    func typeStyle (for item: ExpenseItem4) -> some View {
        let foregroundColor : Color = item.amount < 10 ? .brown : .primary
        return self
            .foregroundColor(foregroundColor)
    }
}











//extension View {
//    func amountStyles (for item : ExpenseItem4) -> some View {
//        var font : Font = .body
//        var foregroundColor : Color = .primary
//        
//        if item.amount < 10 {
//            font = .body
//            foregroundColor = .yellow
//        }
//        if item.amount < 100 {
//            font = .title3
//            
//        }else {
//            font = .title
//        }
//        return self
//            .font(font)
//            .foregroundColor(foregroundColor)
//    }
//    
//    func typeStyles(for item : ExpenseItem4) -> some View {
//        let foregroundColor : Color = item.amount < 10 ? .brown : .primary
//        return self
//            .foregroundColor(foregroundColor)
//        
//    }
//    
//}
