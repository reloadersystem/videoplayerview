//
//  ViewController.swift
//  videoplayer
//
//  Created by Resembrink Correa on 4/23/20.
//  Copyright © 2020 reloader. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonAction(_ sender: Any) {
        if let path = Bundle.main.path(forResource: "developer", ofType: "mp4")
        {
            let video = AVPlayer(url:   URL(fileURLWithPath: path))
            let videoplayer = AVPlayerViewController()
            videoplayer.player = video
           NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: .AVPlayerItemDidPlayToEndTime, object: nil)
            
            
            videoplayer.showsPlaybackControls=false
            videoplayer.videoGravity = AVLayerVideoGravity.resize
            present(videoplayer, animated: true, completion: {
                video.play()
            })
            
            
            
        }
    }
    
    @objc func playerDidFinishPlaying(note: NSNotification) {
        print("Video Finished")
    }
    
}

