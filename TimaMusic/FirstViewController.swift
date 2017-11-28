//
//  FirstViewController.swift
//  TimaMusic
//
//  Created by Tima on 12.11.17.
//  Copyright © 2017 Tima. All rights reserved.
//

import UIKit
import AVFoundation



class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AVAudioPlayerDelegate {
 
    
    @IBOutlet weak var myTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        AudioPlayer.shared.delegate = self
        return AudioPlayer.shared.songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = AudioPlayer.shared.songs[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        do
        {
            let audioPath = Bundle.main.path(forResource: AudioPlayer.shared.songs[indexPath.row], ofType: ".mp3")
            try AudioPlayer.shared.audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath:audioPath!) as URL)
            AudioPlayer.shared.audioPlayer.play()
            AudioPlayer.shared.thisSong = indexPath.row
            AudioPlayer.shared.audioStuffed = true
        }
        catch
        {
            print("Error")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        AudioPlayer.shared.gettingSongName()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func updateTable() {
        myTableView.reloadData()
    }
    

}

