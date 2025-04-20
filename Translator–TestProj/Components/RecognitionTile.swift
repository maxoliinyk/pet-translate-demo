//
//  RecognitionTile.swift
//  Translator–TestProj
//
//  Created by Max Oliinyk on 17.04.2025.
//

import SwiftUI
import Lottie

struct RecognitionTile: View {
    @EnvironmentObject private var viewModel: TranslatorViewModel

    var body: some View {
        VStack {
            // shows different tile ui depending on recognition state
            switch viewModel.recognitionState {
            case .idle:
                Button {
                    // check if recognition + mic usage is allowed
                    viewModel.authorize { authorized in
                        if authorized {
                            withAnimation { viewModel.recognitionState = .listening }
                            viewModel.recognizedText = ""
                            viewModel.startRecognition()
                        } else {
                            print("Not authorized!")
                        }
                    }
                } label: {
                    VStack {
                        Image(systemName: "microphone")
                            .font(.system(size: 48))
                            .padding(.vertical)
                        Text(viewModel.recognitionState.description).font(.headline)
                    }
                    .padding()
                }
            case .listening:
                Button {
                    viewModel.stopRecognition()
                } label: {
                    VStack {
                        LottieView {
                            try await DotLottieFile.named("waveform")
                        }
                        .playing(loopMode: .loop)
                        Text(viewModel.recognitionState.description).font(.headline)
                    }
                }
                .padding()
            default:
                EmptyView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.customBackground)
        .buttonStyle(.plain)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 10)
        .onDisappear {
            viewModel.stopRecognition()
        }
    }
}

#Preview {
    RecognitionTile()
        .frame(width: 150, height: 150)
}
