//
//  PrivacyPolicy.swift
//  Translator–TestProj
//
//  Created by Max Oliinyk on 19.04.2025.
//

import SwiftUI

struct PrivacyPolicy: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                Text("We value your privacy. We don't collect anything...")
                    .padding()
            }
            .navigationTitle("Privacy Policy")
        }
    }
}

#Preview {
    PrivacyPolicy()
}
