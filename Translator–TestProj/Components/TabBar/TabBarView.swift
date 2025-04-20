//
//  TabBarView.swift
//  Translator–TestProj
//
//  Created by Max Oliinyk on 17.04.2025.
//

import SwiftUI

struct TabBarView: View {
    
    @EnvironmentObject private var viewModel: TranslatorViewModel
    
    var body: some View {
        HStack(spacing: 12) {
            TabBarItem(systemName: "translate", title: "Translator", isSelected: viewModel.selectedTab == .translator) {
                withAnimation {
                    viewModel.selectedTab = .translator
                }
            }
            
            TabBarItem(systemName: "gear", title: "Settings", isSelected: viewModel.selectedTab == .settings) {
                withAnimation {
                    viewModel.selectedTab = .settings
                }
            }
            
            // testing result remove later
//            TabBarItem(systemName: "checkmark.seal", title: "Result", isSelected: viewModel.selectedTab == .result) {
//                withAnimation {
//                    viewModel.selectedTab = .result
//                }
//            }
        }
        .padding()
        .padding(.horizontal, 20)
        .background(.customBackground)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
