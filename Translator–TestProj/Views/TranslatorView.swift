//
//  TranslationView.swift
//  Translator–TestProj
//
//  Created by Max Oliinyk on 17.04.2025.
//

import SwiftUI

struct TranslatorView: View {
    @EnvironmentObject private var viewModel: TranslatorViewModel

    var body: some View {
        VStack(alignment: .center) {
            TranslateOptionsView()
            
            Spacer()

            if viewModel.recognitionState == .processing {
                Text("Process of translation...")
                    .font(.headline)
                    .padding(.vertical, 20)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withAnimation {
                                viewModel.selectedTab = .result
                                viewModel.recognitionState = .idle
                            }
                        }
                    }
            } else {
                
                if viewModel.isHumanToPet {
                    Text(viewModel.recognizedText.isEmpty ? "" : viewModel.recognizedText)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                        .padding(8)
                }

                GeometryReader { geometry in
                    let tileWidth = min(geometry.size.width / 2, geometry.size.height)
                    
                    HStack(spacing: 30) {
                        RecognitionTile()
                            .frame(width: tileWidth, height: tileWidth)
                        
                        PetSelectionTile()
                            .frame(height: tileWidth)
                    }
                    .frame(maxWidth: .infinity)
                }
                .frame(height: 200)
                .padding(.horizontal)
                .padding(.vertical, 20)
            }

            Spacer()

            Image(viewModel.selectedPet.rawValue)
                .petImage()
        }
    }
}

#Preview {
    TranslatorView()
}
