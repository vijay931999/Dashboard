//
//  JobDescriptionView.swift
//  JobDashboard
//
//  Created by vijay on 12/09/24.
//

import SwiftUI

struct JobDescriptionView: View {
    var job: Job

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("#\(job.jobNumber)")
                .foregroundStyle(Color.subtitle_Color)
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(16)
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text(job.title)
                        .foregroundStyle(Color.title_Color)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 16)

                    Text(job.startTime.toDate().formattedDateTime(to: job.endTime.toDate()))
                        .foregroundStyle(Color.subtitle_Color)
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .padding(.horizontal, 16)
                }
                Spacer()
            }
            .padding(.bottom, 16)
        }

        .overlay(
            RoundedRectangle(cornerRadius: 5, style: .continuous)
                .stroke(lineWidth: 2)
                .foregroundStyle(Color.border_Color)
        )

    }
}
