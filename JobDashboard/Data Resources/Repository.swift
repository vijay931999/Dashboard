//
//  Repository.swift
//  JobDashboard
//
//  Created by vijay on 11/09/24.
//

import Foundation
import Combine

protocol Repository {
    func fetchJobs() -> AnyPublisher<[Job], Never>
    func fetchInvoices() -> AnyPublisher<[Invoice], Never>
}

class SampleDataRepository: Repository {
    func fetchJobs() -> AnyPublisher<[Job], Never> {
        let jobs = SampleData.getJobs(size: 60)
        return Just(jobs)
            .eraseToAnyPublisher()
    }

    func fetchInvoices() -> AnyPublisher<[Invoice], Never> {
        let invoices = SampleData.getInvoices(size: 30)
        return Just(invoices)
            .eraseToAnyPublisher()
    }
}
