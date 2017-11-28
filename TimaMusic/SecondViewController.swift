//
//  SecondViewController.swift
//  TimaMusic
//
//  Created by Tima on 12.11.17.
//  Copyright © 2017 Tima. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {
   
    
    @IBOutlet weak var mainUIView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBAction func play(_ sender: Any) {
        
        if AudioPlayer.shared.audioStuffed == true && AudioPlayer.shared.audioPlayer.isPlaying == false {
            print("Play")
            AudioPlayer.shared.audioPlayer.play()
        }
    }
    
    @IBAction func pause(_ sender: Any) {
        if AudioPlayer.shared.audioStuffed == true && AudioPlayer.shared.audioPlayer.isPlaying {
            AudioPlayer.shared.audioPlayer.pause()
        }
        
    }
    
    @IBAction func prev(_ sender: Any) {
        if AudioPlayer.shared.thisSong != 0 && AudioPlayer.shared.audioStuffed == true{
            AudioPlayer.shared.playThis(thisOne: AudioPlayer.shared.songs[AudioPlayer.shared.thisSong-1])
            AudioPlayer.shared.thisSong -= 1
            label.text = AudioPlayer.shared.songs[AudioPlayer.shared.thisSong]
        }
        else{
            
        }
        
    }
    
    @IBAction func next(_ sender: Any) {
        if AudioPlayer.shared.thisSong < AudioPlayer.shared.songs.count - 1 && AudioPlayer.shared.audioStuffed == true{
            AudioPlayer.shared.playThis(thisOne: AudioPlayer.shared.songs[AudioPlayer.shared.thisSong+1])
            AudioPlayer.shared.thisSong += 1
            label.text = AudioPlayer.shared.songs[AudioPlayer.shared.thisSong]
        }
        else{
            
        }
        
    }
    @IBAction func slider(_ sender: UISlider) {
        if AudioPlayer.shared.audioStuffed == true{
            AudioPlayer.shared.audioPlayer.volume = sender.value
        }
    }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        AudioPlayer.shared.gettingSongName()
        label.text = AudioPlayer.shared.songs[AudioPlayer.shared.thisSong]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

