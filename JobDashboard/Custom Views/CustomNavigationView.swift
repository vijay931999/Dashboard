//
//  CustomNavigationView.swift
//  JobDashboard
//
//  Created by vijay on 10/09/24.
//

import Foundation
import SwiftUI
struct CustomNavigationView<Content: View>: View {
    let content: Content
    let title: String
    let isFirstView: Bool
    @Environment(\.dismiss) private var dismiss

    init(title: String, isFirstView: Bool = false, @ViewBuilder content: () -> Content) {
        self.title = title
        self.isFirstView = isFirstView
        self.content = content()
    }

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    if !isFirstView {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "arrow.left")
                                .padding(.leading)
                        }

                    }
                    Text(title)
                        .padding(.leading,isFirstView ? 16 : 8)
                    Spacer()
                }
                .foregroundStyle(Color.title_Color)
                .font(.headline)
                .frame(height: 44)
                .background(Color.white)
                Rectangle()
                    .fill(Color.separator_Line_Color)
                    .frame(maxWidth: .infinity)
                    .frame(height: 2)
                content
                    .padding(.top, 16)
                Spacer()
            }
        }
    }
}
