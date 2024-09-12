//
//  HorizontalScrollPicker.swift
//  JobDashboard
//
//  Created by vijay on 11/09/24.
//
import SwiftUI

struct HorizontalScrollPicker: View {
    @Binding var jobs: [Job]
    @Binding var selectedJobStatus: JobStatus

    var sortedStats: [(key: JobStatus, value: Int)] {
        Array(jobStats)
            .sorted { $0.key.chartLegendPriority < $1.key.chartLegendPriority }
    }

    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(sortedStats, id: \.key) { item in
                        HorizontalScrollItemView(jobStatus: item.key, selectedJobStatus: $selectedJobStatus, count: item.value)
                            .onTapGesture {
                                selectedJobStatus = item.key
                            }
                    }
                }
                .padding(.horizontal)
            }
        }
    }

    private var jobStats: [JobStatus: Int] {
        var stats = [JobStatus: Int]()
        for status in JobStatus.allCases {
            stats[status] = jobs.filter { $0.status == status }.count
        }
        return stats
    }
}

struct HorizontalScrollItemView: View {
    var jobStatus: JobStatus
    @Binding var selectedJobStatus: JobStatus
    var count: Int

    var isSelected: Bool {
        jobStatus == selectedJobStatus
    }

    var body: some View {
        VStack(spacing: 0) {
            Text("\(jobStatus.name) (\(count))")
                .padding(8)
                .foregroundColor(isSelected ? Color.title_Color : Color.headline_Color)
                .font(.subheadline)
                .fontWeight(.bold)
                .padding(.bottom, 8)
            Rectangle()
                .fill(isSelected ? Color.selected_Item_Line_Color : Color.clear)
                .frame(height: 2)
                .frame(maxWidth: .infinity)
            Rectangle()
                .fill(Color.unselected_Item_Line_Color)
                .frame(height: 1)
                .frame(maxWidth: .infinity)
        }
    }
}
