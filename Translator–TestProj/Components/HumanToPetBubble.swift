//
//  HumanToPetBubble.swift
//  Translator–TestProj
//
//  Created by Max Oliinyk on 20.04.2025.
//

import SwiftUI

struct HumanToPetBubble: View {
    
    @EnvironmentObject private var viewModel: TranslatorViewModel
    
    var body: some View {
        Button(action: viewModel.playRandomPetSound) {
            VStack {
                Text(viewModel.recognizedText)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 18, weight: .medium))
                    .fixedSize(horizontal: false, vertical: true)
                    .padding()
                
                Image(systemName: "speaker.wave.3.fill")
                    .font(.title)
                    .padding(.bottom)
                    .padding(.horizontal)
            }
        }
        .buttonStyle(.plain)
        .frame(minHeight: 75)
        .frame(width: 300)
        .background(.lavender)
        .clipShape(RoundedRectangle(cornerRadius: 18))
    }
}

