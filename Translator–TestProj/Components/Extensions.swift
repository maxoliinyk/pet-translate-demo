//
//  Extensions.swift
//  Translator–TestProj
//
//  Created by Max Oliinyk on 20.04.2025.
//

import Foundation
import SwiftUI

extension View {
    func roundedButton() -> some View {
        self
            .font(.system(size: 18, weight: .medium))
            .buttonStyle(.plain)
            .frame(minHeight: 75)
            .frame(width: 300)
            .background(.lavender)
            .clipShape(RoundedRectangle(cornerRadius: 18))
    }
}

extension Image {
    func petImage() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(height: 200)
            .padding(.vertical, 32)
    }
}
