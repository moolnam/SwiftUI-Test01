//
//  AudioPlayer.swift
//  SwiftUI-Test01
//
//  Created by KimJongHee on 2022/06/16.
//

import Foundation
import AVFoundation


var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        }
        catch {
            print(error.localizedDescription)
        }
    }
}
