//
//  AudioPlayer.swift
//  TimaMusic
//
//  Created by Tima on 28.11.2017.
//  Copyright © 2017 Tima. All rights reserved.
//

import UIKit
import AVFoundation

protocol AVAudioPlayerDelegate: class {
    func updateTable()
}

class AudioPlayer: NSObject {
    
    static let shared = AudioPlayer()
    
    var songs:[String] = []
    var audioPlayer = AVAudioPlayer()
    var thisSong = 0
    var audioStuffed = false
    
    weak var delegate: AVAudioPlayerDelegate?
    
    private override init() {}
    
    func playThis(thisOne:String){
        do
        {
            let audioPath = Bundle.main.path(forResource: thisOne, ofType: ".mp3")
            try AudioPlayer.shared.audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath:audioPath!) as URL)
            audioPlayer.play()
        }
        catch
        {
            print("Error")
        }
        
    }
    
    func gettingSongName()
    {
    
        let folderURL = URL(fileURLWithPath: Bundle.main.resourcePath!)
        
        do
        {
            let songPath = try FileManager.default.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            
            
        
            for song in songPath
            {
                var mySong = song.absoluteString
                
                if mySong.contains(".mp3")
                {
                    let findString = mySong.components(separatedBy: "/")
                    mySong = findString[findString.count-1]
                    mySong = mySong.replacingOccurrences(of: "%20", with: " ")
                    mySong = mySong.replacingOccurrences(of: ".mp3", with: "")
                    songs.append(mySong)
                    
                }
            }
            delegate?.updateTable()
        }
        catch
        {
            print("catch")
        }
    }
}
