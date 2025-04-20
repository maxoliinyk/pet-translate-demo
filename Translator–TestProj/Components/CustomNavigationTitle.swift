//
//  CustomNavigationTitle.swift
//  Translator–TestProj
//
//  Created by Max Oliinyk on 17.04.2025.
//

import SwiftUI

struct CustomNavigationTitle: View {
    
    @EnvironmentObject private var viewModel: TranslatorViewModel
    
    var body: some View {
        ZStack {
            if viewModel.selectedTab == .result {
                // improve styling later
                HStack {
                    Button {
                        withAnimation {
                            viewModel.selectedTab = .translator
                            viewModel.recognizedText = ""
                        }
                        
                    } label: {
                        Label("Close result view", systemImage: "xmark.circle")
                            .font(.largeTitle)
                            .labelStyle(.iconOnly)
                    }
                    .buttonStyle(.plain)
                    .padding(.horizontal, 24)
                    
                    Spacer()
                }
            }
            
            Text(viewModel.selectedTab.title)
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.vertical, 16)
        }
    }
}

#Preview {
    CustomNavigationTitle()
}
