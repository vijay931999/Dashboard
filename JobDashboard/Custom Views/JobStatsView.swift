//
//  StatsView.swift
//  JobDashboard
//
//  Created by vijay on 10/09/24.
//

import SwiftUI

struct JobStatsView: View {
    var jobs: [Job]?
    @State var rows = [GridItem(.flexible(), spacing: 0),
                       GridItem(.flexible(), spacing: 0)]

    var totalJobs: Int {
        jobs?.count ?? 0
    }

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            HStack {
                Text("Jobs")
                    .foregroundStyle(Color.title_Color)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .padding(16)
                Spacer()
            }


            Rectangle()
                .fill(Color.separator_Line_Color)
                .frame(maxWidth: .infinity)
                .frame(height: 2)

            HStack {
                Text("\(totalJobs) Jobs")
                Spacer()
                Text("\(jobStats[.completed] ?? 0) of \(totalJobs) completed")
            }
            .foregroundStyle(Color.subtitle_Color)
            .font(.subheadline)
            .fontWeight(.bold)
            .padding(16)

            DashboardChartView(stats: jobStats)
                .padding(.horizontal, 16)
            ChartLegendView(stats: jobStats)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 5, style: .continuous)
                .stroke(lineWidth: 2)
                .foregroundStyle(Color.border_Color)
        )

    }

    private var jobStats: [JobStatus: Int] {
        var stats = [JobStatus: Int]()
        for status in JobStatus.allCases {
            stats[status] = jobs?.filter { $0.status == status }.count
        }
        return stats
    }
}
