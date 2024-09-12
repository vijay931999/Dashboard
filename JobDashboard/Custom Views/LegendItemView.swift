//
//  LegendItemView.swift
//  JobDashboard
//
//  Created by vijay on 11/09/24.
//

import SwiftUI

struct LegendItemView<T: DashboardChartItem>: View {
    var item: T
    var count: Int

    var body: some View {
        HStack(spacing: 8) {
            RoundedRectangle(cornerRadius: 4)
                .fill(item.color)
                .frame(width: 12, height: 12)

            Text("\(item.name) (\( item.statsType == .job ? "\(count)" : count.toCurrency()))")
                .foregroundStyle(Color.subtitle_Color)
                .font(.subheadline)
                .fontWeight(.bold)
        }
    }
}
