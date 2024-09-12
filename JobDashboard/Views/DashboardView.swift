//
//  ContentView.swift
//  JobDashboard
//
//  Created by vijay on 10/09/24.
//

import SwiftUI

struct DashboardView: View {
    @StateObject var viewModel = DashboardViewModel()

    var body: some View {
        CustomNavigationView(title: "Dashboard", isFirstView: true) {
            VStack(spacing: 16) {
                UserDetailsView()
                    .padding(.horizontal, 16)
                NavigationLink(destination: JobListView(viewModel: viewModel)
                    .navigationBarBackButtonHidden(true)) {
                        JobStatsView(jobs: viewModel.jobs)
                            .padding(.horizontal, 16)
                    }
                InvoiceStatsView(invoices: viewModel.invoices)
                    .padding(.horizontal, 16)
            }
        }
        .onAppear {
            viewModel.fetchJobs()
            viewModel.fetchInvoices()
        }
    }
}
