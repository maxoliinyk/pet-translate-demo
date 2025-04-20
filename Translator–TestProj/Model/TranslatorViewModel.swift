//
//  TranslatorViewModel.swift
//  Translator–TestProj
//
//  Created by Max Oliinyk on 17.04.2025.
//

import Foundation
import Speech
import AVFoundation

class TranslatorViewModel: ObservableObject {
    private let recognizer = SFSpeechRecognizer(locale: Locale(identifier: "en-US"))
    private var audioEngine: AVAudioEngine?
    private var request: SFSpeechAudioBufferRecognitionRequest?
    private var task: SFSpeechRecognitionTask?
    
    @Published var recognizedText: String = ""
    @Published var selectedPhrase: String = ""
    @Published var isHumanToPet: Bool = true
    @Published var selectedTab: Tab = .translator
    @Published var selectedPet: Pet = .cat
    @Published var recognitionState: RecognitionState = .idle
    
    func authorize(completion: @escaping (Bool) -> Void) {
        SFSpeechRecognizer.requestAuthorization { status in
            DispatchQueue.main.async {
                completion(status == .authorized)
            }
        }
    }
    
    func startRecognition() {
        stopRecognition()
        let engine = AVAudioEngine()
        self.audioEngine = engine
        
        do {
            let session = AVAudioSession.sharedInstance()
            try session.setCategory(.record, mode: .measurement, options: .duckOthers)
            try session.setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            print("Audio session error: \(error)")
        }
        
        request = SFSpeechAudioBufferRecognitionRequest()
        guard let request = request else {
            print("Failed to create request")
            return
        }
        
        request.shouldReportPartialResults = true
        
        let inputNode = engine.inputNode
        let format = inputNode.outputFormat(forBus: 0)
        inputNode.removeTap(onBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: format) { buffer, _ in
            self.request?.append(buffer)
        }
        
        task = recognizer?.recognitionTask(with: request) { [weak self] result, error in
            guard let self = self else { return }
            if let result = result {
                let transcript = result.bestTranscription.formattedString
                DispatchQueue.main.async {
                    self.recognizedText = transcript
                }
            }
            if result?.isFinal == true || error != nil || result == nil {
                DispatchQueue.main.async {
                    self.recognitionState = .processing
                }
            }
        }
        
        do {
            try engine.start()
        } catch {
            print("audioEngine couldn't start: \(error)")
        }
    }
    
    func stopRecognition() {
        audioEngine?.stop()
        audioEngine?.inputNode.removeTap(onBus: 0)
        request?.endAudio()
        task?.cancel()
        audioEngine = nil
        request = nil
        task = nil
        
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setActive(false, options: .notifyOthersOnDeactivation)
            try session.setCategory(.playback, options: .mixWithOthers)
        } catch {
            print("Failed to deactivate audio session: \(error)")
        }
    }
    
    // play audio
    private var audioPlayer: AVAudioPlayer?
    
    func playRandomPetSound() {
        guard let randomSound = selectedPet.sounds.randomElement(),
              let url = Bundle.main.url(forResource: randomSound, withExtension: "wav") else { return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error playing sound: \(error)")
        }
    }
    
    let petPhrases = [
        "I WANNA EAT SO BAAAAD",
        "Play with me, hooman!",
        "Nap time again?",
        "Where's my belly rub?",
        "Let’s go outside!",
        "I saw a squirrel!!!",
        "Can I have a treat?",
        "Someone’s at the door!",
        "I missed you!",
        "Why are you leaving?",
        "Pet me, pet me, pet me!",
        "Is that food for me?",
        "Look what I found!",
        "Let’s cuddle.",
        "Don’t forget my dinner.",
        "Throw the ball!",
        "I’m bored.",
        "Sniff sniff... what's that?",
        "Rub my ears, please.",
        "I'm the goodest boy!"
    ]
    
    func pickRandomPhrase() {
        selectedPhrase = petPhrases.randomElement() ?? ""
    }
}

