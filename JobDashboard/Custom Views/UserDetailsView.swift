//
//  UserDetailsView.swift
//  JobDashboard
//
//  Created by vijay on 10/09/24.
//

import SwiftUI

struct UserDetailsView: View {
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Hello, Vijay Kumar! 👋")
                        .foregroundStyle(Color.title_Color)
                        .font(.title2)
                    Text(Date().formattedDate())
                        .foregroundStyle(Color.subtitle_Color)
                        .font(.subheadline)
                }
                .fontWeight(.semibold)
                Spacer()
                Image("profilePicture")
                    .resizable()
                    .frame(width: 64, height: 64)
                    .clipShape(RoundedRectangle(cornerRadius: 5, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
                    .overlay(
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .stroke(lineWidth: 2)
                            .foregroundStyle(Color.profilePicture_Border_Color)
                    )
            }
            .padding(16)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 5, style: .continuous)
                .stroke(lineWidth: 1)
                .foregroundStyle(Color.border_Color)
        )
    }
}
