//
//  TranslateOptionsView.swift
//  Translator–TestProj
//
//  Created by Max Oliinyk on 20.04.2025.
//

import SwiftUI

struct TranslateOptionsView: View {
    
    @EnvironmentObject private var viewModel: TranslatorViewModel
    
    var body: some View {
        HStack(spacing: 0) {
            Spacer()
            
            Text(viewModel.isHumanToPet ? "Human" : "Pet")
                .font(.headline)
                .frame(width: 70, alignment: .center)
            
            Spacer()
            
            Button {
                withAnimation { viewModel.isHumanToPet.toggle() }
            } label: {
                Image(systemName: "arrow.left.arrow.right")
                    .font(.headline)
            }
            .frame(width: 28)
            .buttonStyle(.plain)
            .contentShape(Rectangle())
            
            Spacer()
            
            Text(viewModel.isHumanToPet ? "Pet" : "Human")
                .font(.headline)
                .frame(width: 70, alignment: .center)
            
            Spacer()
        }
        .textCase(.uppercase)
        .padding(.top, 30)
        .padding(.horizontal)
    }
}

#Preview {
    TranslateOptionsView()
}
