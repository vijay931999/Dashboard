//
//  ChartlegendView.swift
//  JobDashboard
//
//  Created by vijay on 10/09/24.
//

import SwiftUI

struct ChartLegendView<T: DashboardChartItem  & Hashable>: View {
    var stats: [T: Int]

    var sortedStats: [(key: T, value: Int)] {
        Array(stats)
            .sorted { $0.key.chartLegendPriority < $1.key.chartLegendPriority }
    }

    var body: some View {
        VStack(alignment: .center) {
            ForEach(0..<(sortedStats.count / 2), id: \.self) { rowIndex in
                HStack(alignment: .center, spacing: 16) {
                    ForEach(0..<2) { columnIndex in
                        let itemIndex = (rowIndex * 2) + columnIndex
                        if itemIndex < sortedStats.count {
                            let item = sortedStats[itemIndex]
                            LegendItemView(item: item.key, count: item.value)
                        }
                    }
                }
            }

            if sortedStats.count % 2 == 1,
               let lastItem = sortedStats.last {
                LegendItemView(item: lastItem.key, count: lastItem.value)
            }
        }
        .padding()
    }
}
