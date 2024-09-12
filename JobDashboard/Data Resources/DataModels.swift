//
//  DataModels.swift
//  JobDashboard
//
//  Created by vijay on 11/09/24.
//

import Foundation
import SwiftUI

public struct Job {
    public let id = UUID()
    public let jobNumber: Int
    public let title: String
    public let startTime: String
    public let endTime: String
    public let status: JobStatus
}


public enum JobStatus: String, CaseIterable, Hashable, DashboardChartItem {
    case yetToStart = "Yet to Start"
    case inProgress = "In Progress"
    case cancelled = "Cancelled"
    case completed = "Completed"
    case incomplete = "Incomplete"

    var name: String {
        self.rawValue
    }

    var statsType: StatsType {
        .job
    }

    var color: Color {
        switch self {
        case .yetToStart:
                .yetToStartColor
        case .inProgress:
                .inProgessColor
        case .cancelled:
                .cancelledColor
        case .completed:
                .completedColor
        case .incomplete:
                .incompletedColor
        }
    }

    var dashboardChartPriority: Int {
        switch self {
        case .yetToStart:
            return 3
        case .inProgress:
            return 2
        case .cancelled:
            return 4
        case .completed:
            return 1
        case .incomplete:
            return 5
        }
    }

    var chartLegendPriority: Int {
        switch self {
        case .yetToStart:
            return 1
        case .inProgress:
            return 2
        case .cancelled:
            return 3
        case .completed:
            return 4
        case .incomplete:
            return 5
        }
    }
}

public struct Invoice {
    public let id = UUID()
    public let invoiceNumber: Int
    public let customerName: String
    public let total: Int
    public let status: InvoiceStatus
}

public enum InvoiceStatus: String, CaseIterable, Hashable, DashboardChartItem {
    case draft = "Draft"
    case pending = "Pending"
    case paid = "Paid"
    case badDebt = "Bad Debt"

    var name: String {
        self.rawValue
    }

    var statsType: StatsType {
        .invoice
    }

    var color: Color {
        switch self {
        case .draft:
                .cancelledColor
        case .pending:
                .inProgessColor
        case .paid:
                .completedColor
        case .badDebt:
                .incompletedColor
        }
    }

    var dashboardChartPriority: Int {
        switch self {
        case .draft:
            return 3
        case .pending:
            return 1
        case .paid:
            return 2
        case .badDebt:
            return 4
        }
    }

    var chartLegendPriority: Int {
        switch self {
        case .draft:
            return 1
        case .pending:
            return 2
        case .paid:
            return 3
        case .badDebt:
            return 4
        }
    }
}

public enum StatsType {
    case job, invoice
}

protocol DashboardChartItem {
    var name: String { get }
    var color: Color { get }
    var dashboardChartPriority: Int { get }
    var chartLegendPriority: Int { get }
    var statsType: StatsType { get }
}
