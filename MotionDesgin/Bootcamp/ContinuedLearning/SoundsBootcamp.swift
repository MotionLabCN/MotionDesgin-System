//
//  SoundsBootcamp.swift
//  MotionDesgin
//
//  Created by 梁泽 on 2021/9/14.
//

import SwiftUI
import AVKit


//MARK: - sound管理
/*
 音频网址
 https://www.freesoundslibrary.com/
 */
class SoundManager {
    static let shared = SoundManager()
    
    var player: AVAudioPlayer?
    
    func playSound() {
        let url = Bundle.main.url(forResource: "Duck-quack", withExtension: "mp3")!
        player = try? AVAudioPlayer(contentsOf: url)
        player?.play()
    }
}



struct SoundsBootcamp: View {
    var soundManager = SoundManager()
    
    var body: some View {
        VStack(spacing: 40.0) {
            Button("play sound 1" ) {
                SoundManager.shared.playSound()
            }
            
            Button("play sound 2") {
                
            }
        }
    }
}

struct SoundsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SoundsBootcamp()
    }
}


