//
//  Int+App.swift
//  JobDashboard
//
//  Created by vijay on 12/09/24.
//

import Foundation

extension Int {
    func toCurrency() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale.current
        numberFormatter.currencySymbol = "$"
        numberFormatter.maximumFractionDigits = 0
        numberFormatter.minimumFractionDigits = 0

        let number = NSNumber(value: self)
        return numberFormatter.string(from: number) ?? ""
    }
}
