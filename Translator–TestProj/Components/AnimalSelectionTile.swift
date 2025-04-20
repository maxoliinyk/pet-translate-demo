//
//  PetSelectionTile.swift
//  Translator–TestProj
//
//  Created by Max Oliinyk on 17.04.2025.
//

import SwiftUI

struct PetSelectionTile: View {
    
    @EnvironmentObject private var viewModel: TranslatorViewModel

    var body: some View {
        VStack(spacing: 12) {
            PetSelectionItem(image: .cat, background: AnyShapeStyle(Color.teal), isSelected: viewModel.selectedPet == .cat) {
                withAnimation {
                    viewModel.selectedPet = .cat
                }
            }
            
            PetSelectionItem(image: .dog, background: AnyShapeStyle(Color.green), isSelected: viewModel.selectedPet == .dog) {
                withAnimation {
                    viewModel.selectedPet = .dog
                }
            }
        }
        .frame(maxHeight: .infinity)
        .padding()
        .background(.customBackground)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 10)
    }
}

struct PetSelectionItem: View {
    
    let image: ImageResource
    let background: AnyShapeStyle
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(image)
                .resizable()
                .padding()
                .scaledToFit()
        }
        .background(background)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .opacity(isSelected ? 1 : 0.5)
        .saturation(isSelected ? 1 : 0.5)
    }
}

#Preview {
    PetSelectionTile()
}
