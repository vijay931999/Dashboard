//
//  DashboardViewModel.swift
//  JobDashboard
//
//  Created by vijay on 11/09/24.
//

import Foundation
import SwiftUI
import Combine

class DashboardViewModel: ObservableObject {
    @Published var jobs: [Job] = []
    @Published var invoices: [Invoice] = []

    private var cancellables = Set<AnyCancellable>()
    private let repository: Repository

    init(repository: Repository = SampleDataRepository()) {
        self.repository = repository
        fetchJobs()
        fetchInvoices()
    }

    func fetchJobs() {
        repository.fetchJobs()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] jobs in
                self?.jobs = jobs
            }
            .store(in: &cancellables)
    }

    func fetchInvoices() {
        repository.fetchInvoices()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] invoices in
                self?.invoices = invoices
            }
            .store(in: &cancellables)
    }
}
