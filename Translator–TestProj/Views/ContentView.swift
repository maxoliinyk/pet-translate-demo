//
//  ContentView.swift
//  Translator–TestProj
//
//  Created by Max Oliinyk on 17.04.2025.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var viewModel: TranslatorViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                CustomNavigationTitle()
                
                Spacer()
                
                Group {
                    switch viewModel.selectedTab {
                        case .translator: TranslatorView()
                        case .settings: SettingsView()
                        case .result: ResultView()
                    }
                }
                .frame(maxWidth: .infinity)
                
                Spacer()
                
                TabBarView()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                LinearGradient(
                    colors: [.gradientStart, .gradientEnd],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
            )
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(TranslatorViewModel())
}
