//
//  Date+App.swift
//  JobDashboard
//
//  Created by vijay on 12/09/24.
//

import Foundation

extension Date {
    func formattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM d"
        let day = Calendar.current.component(.day, from: self)
        let ordinalSuffix = ordinalSuffix(for: day)
        let dateWithoutYear = dateFormatter.string(from: self)
        let formattedString = "\(dateWithoutYear)\(ordinalSuffix), \(Calendar.current.component(.year, from: self))"
        return formattedString
    }

    private func ordinalSuffix(for day: Int) -> String {
        switch day {
        case 1, 21, 31:
            return "st"
        case 2, 22:
            return "nd"
        case 3, 23:
            return "rd"
        default:
            return "th"
        }
    }

    func formattedDateTime(to endDate: Date) -> String {
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()

        if calendar.isDateInToday(self) {
            dateFormatter.dateFormat = "h:mm a"
            let startTime = dateFormatter.string(from: self)
            let endTime = dateFormatter.string(from: endDate)
            return "Today, \(startTime) - \(endTime)"
        }

        if !calendar.isDate(self, inSameDayAs: endDate) {
            dateFormatter.dateFormat = "dd/MM/yyyy, h:mm a"
            let startDate = dateFormatter.string(from: self)
            let endDateString = dateFormatter.string(from: endDate)
            return "\(startDate) → \(endDateString)"
        }

        dateFormatter.dateFormat = "dd/MM/yyyy, h:mm a"
        let startTime = dateFormatter.string(from: self)
        let endTime = dateFormatter.string(from: endDate)
        return "\(startTime) - \(endTime)"
    }
}
