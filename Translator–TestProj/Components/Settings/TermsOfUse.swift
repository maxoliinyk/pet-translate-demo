//
//  TermsOfUse.swift
//  Translator–TestProj
//
//  Created by Max Oliinyk on 19.04.2025.
//

import SwiftUI

struct TermsOfUse: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                Text("These are the terms and conditions for using this app.")
                    .padding()
            }
            .navigationTitle("Terms of Use")
        }
    }
}

#Preview {
    TermsOfUse()
}
