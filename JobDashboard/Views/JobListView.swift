//
//  JobListView.swift
//  JobDashboard
//
//  Created by vijay on 10/09/24.
//

import SwiftUI

struct JobListView: View {
    @ObservedObject var viewModel: DashboardViewModel
    @State var selectedJobStatus: JobStatus = .yetToStart

    var totalJobs: Int {
        viewModel.jobs.count
    }

    var filteredJobs: [Job] {
        viewModel.jobs.filter({ $0.status == selectedJobStatus })
    }

    var body: some View {
        CustomNavigationView(title: "Jobs(60)") {
            VStack(alignment: .center, spacing: 16) {
                HStack {
                    Text("\(totalJobs) Jobs")
                    Spacer()
                    Text("\(jobStats[.completed] ?? 0) of \(totalJobs) completed")
                }
                .foregroundStyle(Color.subtitle_Color)
                .font(.subheadline)
                .fontWeight(.bold)
                .padding(.horizontal, 16)
                DashboardChartView(stats: jobStats)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 8)
                Rectangle()
                    .fill(Color.separator_Line_Color)
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                HorizontalScrollPicker(jobs: $viewModel.jobs, selectedJobStatus: $selectedJobStatus)
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(filteredJobs, id: \.id) { job in
                            JobDescriptionView(job: job)
                        }
                    }
                    .padding(.top, 16)
                    .padding(.horizontal, 16)
                }
            }
        }
        .refreshable {
            viewModel.fetchJobs()
            viewModel.fetchInvoices()
        }
    }

    private var jobStats: [JobStatus: Int] {
        var stats = [JobStatus: Int]()
        for status in JobStatus.allCases {
            stats[status] = viewModel.jobs.filter { $0.status == status }.count
        }
        return stats
    }
}
