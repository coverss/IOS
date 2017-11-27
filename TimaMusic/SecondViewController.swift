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
        if audioStuffed == true && audioPlayer.isPlaying == false {
            audioPlayer.play()
        }
    }
    
    @IBAction func pause(_ sender: Any) {
        if audioStuffed == true && audioPlayer.isPlaying {
            audioPlayer.pause()
        }
        
    }
    @IBAction func prev(_ sender: Any) {
        if thisSong != 0 && audioStuffed == true{
            playThis(thisOne: songs[thisSong-1])
            thisSong -= 1
            label.text = songs[thisSong]
        }
        else{
            
        }
        
    }
    @IBAction func next(_ sender: Any) {
        if thisSong < songs.count - 1 && audioStuffed == true{
            playThis(thisOne: songs[thisSong+1])
            thisSong += 1
            label.text = songs[thisSong]
        }
        else{
            
        }
        
    }
    @IBAction func slider(_ sender: UISlider) {
        if audioStuffed == true{
        audioPlayer.volume = sender.value
        }
    }
    func playThis(thisOne:String){
        do
        {
            let audioPath = Bundle.main.path(forResource: thisOne, ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath:audioPath!) as URL)
            audioPlayer.play()
        }
        catch
        {
            print("Error")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = songs[thisSong]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

