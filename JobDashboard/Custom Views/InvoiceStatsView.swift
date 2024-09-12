//
//  InvoiceStatsView.swift
//  JobDashboard
//
//  Created by vijay on 12/09/24.
//

import Foundation
import SwiftUI

struct InvoiceStatsView: View {
    var invoices: [Invoice] = []
    @State var rows = [GridItem(.flexible(), spacing: 0),
                       GridItem(.flexible(), spacing: 0)]

    private var totalAmount: Int {
           invoices.reduce(0) { $0 + $1.total }
       }

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            HStack {
                Text("Invoice Stats")
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
                Text("Total value \(totalAmount.toCurrency())")
                Spacer()
                Text("\(invoiceTotals[.paid]?.toCurrency() ?? "$0") collected")
            }
            .foregroundStyle(Color.subtitle_Color)
            .font(.subheadline)
            .fontWeight(.bold)
            .padding(16)

            DashboardChartView(stats: invoiceTotals)
                .padding(.horizontal, 16)
            ChartLegendView(stats: invoiceTotals)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 5, style: .continuous)
                .stroke(lineWidth: 2)
                .foregroundStyle(Color.border_Color)
        )

    }

    private var invoiceTotals: [InvoiceStatus: Int] {
           var totals = [InvoiceStatus: Int]()
           for status in InvoiceStatus.allCases {
               totals[status] = invoices.filter { $0.status == status }
                   .reduce(0) { $0 + $1.total } // Sum up the total values
           }
           return totals
       }
}
