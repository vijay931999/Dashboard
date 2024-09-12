//
//  DashboardChartView.swift
//  JobDashboard
//
//  Created by vijay on 10/09/24.
//

import SwiftUI


struct DashboardChartView<T: DashboardChartItem & Hashable>: View {
    var stats: [T: Int] = [:]

    var totalItems: Int {
        stats.values.reduce(0, +)
    }

    var sortedStats: [(key: T, value: Int)] {
        Array(stats)
            .sorted { $0.key.dashboardChartPriority < $1.key.dashboardChartPriority }
    }

    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                ForEach(sortedStats, id: \.key) { item in
                    ColorBandView(color: item.key.color, width: getWidth(jobCount: item.value, screenWidth: geometry.size.width))
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
        }
        .frame(height: 25)
    }

    func getWidth(jobCount: Int, screenWidth: CGFloat) -> CGFloat {
        guard totalItems > 0, screenWidth > 0 else { return 0 }
        let width = CGFloat(Double(jobCount) / Double(totalItems)) * screenWidth
        return max(0, width)
    }
}

struct ColorBandView: View {
    var color: Color
    var width: CGFloat

    var body: some View {
        Rectangle()
            .fill(color)
            .frame(width: width)
    }
}
