//
//  Translator_TestProjApp.swift
//  Translator–TestProj
//
//  Created by Max Oliinyk on 17.04.2025.
//

import SwiftUI

@main
struct Translator_TestProjApp: App {
    
    @StateObject private var viewModel = TranslatorViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
