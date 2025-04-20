//
//  TabBarItem.swift
//  Translator–TestProj
//
//  Created by Max Oliinyk on 17.04.2025.
//

import SwiftUI

struct TabBarItem: View {
    
    let systemName: String
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 0) {
                Image(systemName: systemName)
                    .font(.system(size: 22))
                    .frame(height: 22)
                
                Spacer(minLength: 4)
                
                Text(title)
                    .font(.caption)
                    .frame(maxHeight: .infinity, alignment: .bottom)
            }
            .frame(width: 72, height: 36)
            .foregroundStyle(isSelected ? .primary : .secondary)
            .fontWeight(isSelected ? .semibold : .regular)
        }
        .buttonStyle(.plain)
    }
}
