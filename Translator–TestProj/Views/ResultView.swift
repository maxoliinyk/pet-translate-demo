//
//  ResultView.swift
//  Translator–TestProj
//
//  Created by Max Oliinyk on 17.04.2025.
//

import SwiftUI

struct ResultView: View {
    
    @EnvironmentObject private var viewModel: TranslatorViewModel
    @State private var showingBubbles = true
    
    var body: some View {
        VStack {
            Spacer()
            
            if showingBubbles {
                if viewModel.isHumanToPet {
                    HumanToPetBubble()
                } else {
                    SpeechBubble(message: viewModel.selectedPhrase)
                }
            } else {
                Button {
                    withAnimation {
                        showingBubbles = true
                        viewModel.selectedTab = .translator
                    }
                } label: {
                    Label("Repeat", systemImage: "repeat.circle")
                }
                .roundedButton()

            }
            
            Spacer()
            
            Image(viewModel.selectedPet.rawValue)
                .petImage()
        }
        .onAppear {
            viewModel.pickRandomPhrase()
            startTimer()
        }
    }
    
    // using timer to display "repeat" button after 5 seconds
    func startTimer() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            withAnimation {
                showingBubbles = false
            }
        }
    }
}

#Preview {
    ResultView()
}
