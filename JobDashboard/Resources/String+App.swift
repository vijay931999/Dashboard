//
//  String+App.swift
//  JobDashboard
//
//  Created by vijay on 12/09/24.
//

import Foundation

extension String {
    func toDate(withFormat format: String = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'") -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter.date(from: self) ?? Date()
    }
}
