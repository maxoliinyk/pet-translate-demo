//
//  SettingsView.swift
//  Translator–TestProj
//
//  Created by Max Oliinyk on 17.04.2025.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    @State private var showShareSheet = false
    @State private var showPrivacyPolicy = false
    @State private var showTerms = false
    
    let appURL = URL(string: "https://apps.apple.com/")!
    let contactEmail = "support@gmail.com"

    var body: some View {
        NavigationStack {
            ScrollView {
                SettingsButton(title: "Rate Us") {
                    Task {
                        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                            AppStore.requestReview(in: scene)
                        }
                    }
                }
                
                ShareLink(item: appURL, message: Text("Translate your pets here!")) {
                    HStack {
                        Text("Share App")
                            .padding()
                        Spacer()
                        Image(systemName: "chevron.right")
                            .padding()
                    }
                    .font(.headline)
                    .background(.lavender)
                }
                .buttonStyle(.plain)
                .clipShape(Capsule())
                .padding(.horizontal)
                .padding(.vertical, 2)
                                
                SettingsButton(title: "Contact Us") {
                    if let url = URL(string: "mailto:\(contactEmail)") {
                        UIApplication.shared.open(url)
                    }
                }
                
                SettingsButton(title: "Restore Purchases") {
                    // couldn't implement since i don't have paid dev account yet
                    
                    print("Restore purchases tapped")
                }
                
                SettingsButton(title: "Privacy Policy") {
                    showPrivacyPolicy = true
                }
                .sheet(isPresented: $showPrivacyPolicy) {
                    PrivacyPolicy()
                }
                
                SettingsButton(title: "Terms of Use") {
                    showTerms = true
                }
                .sheet(isPresented: $showTerms) {
                    TermsOfUse()
                }
            }
        }
    }
}



#Preview {
    SettingsView()
}
