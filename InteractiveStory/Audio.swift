//
//  Audio.swift
//  InteractiveStory
//
//  Created by Frederico on 02/02/2017.
//  Copyright © 2017 Fuad Adetoro. All rights reserved.
//

import Foundation
import AudioToolbox

extension Story {
    var soundEffectName: String {
        switch self {
        case .droid, .home: return "HappyEnding"
        case .monster: return "Ominous"
        default: return "PageTurn"
        }
    }

    var soundEffectURL: URL {
        let path = Bundle.main.path(forResource: soundEffectName, ofType: "wav")!
        return URL(fileURLWithPath: path)
        
    }
}

class SoundEffectsPlayer {
    var sound: SystemSoundID = 0
    
    func playSound(for story: Story) {
        let soundURL = story.soundEffectURL as CFURL
        AudioServicesCreateSystemSoundID(soundURL, &sound)
        AudioServicesPlaySystemSound(sound)
    }
}
