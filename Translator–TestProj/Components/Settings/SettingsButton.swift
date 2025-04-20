//
//  SettingsButton.swift
//  Translator–TestProj
//
//  Created by Max Oliinyk on 19.04.2025.
//

import SwiftUI

struct SettingsButton: View {
    
    var title: String
    
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .padding()
                Spacer()
                Image(systemName: "chevron.right")
                    .padding()
            }
            .font(.headline)
            .background(.lavender)
        }
        .buttonStyle(.plain)
        .clipShape(Capsule())
        .padding(.horizontal)
        .padding(.vertical, 2)
    }
}
