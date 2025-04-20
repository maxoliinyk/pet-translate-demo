//
//  Enums.swift
//  Translator–TestProj
//
//  Created by Max Oliinyk on 17.04.2025.
//

import Foundation

// Cases for TabBar
enum Tab {
    case translator, settings, result
    
    var title: String {
        switch self {
            case .translator: return "Translator"
            case .settings: return "Settings"
            case .result: return "Result"
        }
    }
}

// Cases for selecting current animal
enum Pet: String {
    case cat, dog
    
    var sounds: [String] {
        switch self {
            case .dog: return ["dog1", "dog2", "dog3"]
            case .cat: return ["cat1", "cat2", "cat3"]
        }
    }
}

// Cases for speech recognition states
enum RecognitionState {
    case idle, listening, processing
    
    var description: String {
        switch self {
            case .idle: return "Start Speaking"
            case .listening: return "Listening..."
            case .processing: return "Processing..."
        }
    }
}
