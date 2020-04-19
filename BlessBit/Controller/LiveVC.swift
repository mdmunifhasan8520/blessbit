//
//  LiveVC.swift
//  BlessBit
//
//  Created by Mac PC on 4/9/20.
//  Copyright © 2020 Ticon. All rights reserved.
//

import UIKit
import SDWebImage
import AVKit
import AVFoundation

class LiveVC: UIViewController {
    
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var channelTitle: UILabel!
    @IBOutlet weak var creationLbl: UILabel!
    @IBOutlet weak var startTimeLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var endTimeLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    
    let avPlayerViewController = AVPlayerViewController()
    var avPlayer: AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        LiveDataService.instance.getLive_itemsFromAPI {
            print("get live items from API")
            self.updateView()
            print("URL \(LiveDataService.instance.liveItems[0].live_url)")
        }
        
    }
    func get_liveURL() {
        let liveURL: NSURL? = NSURL(string: "\(LiveDataService.instance.liveItems[0].live_url)")
        if let url = liveURL {
            self.avPlayer = AVPlayer(url: url as URL)
            self.avPlayerViewController.player = self.avPlayer
        }
    }
    @IBAction func playLive(_ sender: Any) {
        print("hello")
        
        self.present(self.avPlayerViewController, animated: true) {
            self.avPlayerViewController.player?.play()
        }
    }
    
    func updateView() {
        bgImage.sd_setImage(with: URL(string: "\(LiveDataService.instance.liveItems[0].bgImg)"))
        channelTitle.text = LiveDataService.instance.liveItems[0].channelName
        descriptionLbl.text = LiveDataService.instance.liveItems[0].channelName
        creationLbl.text = LiveDataService.instance.liveItems[0].creation_date
        startTimeLbl.text = LiveDataService.instance.liveItems[0].start_time
        endTimeLbl.text = LiveDataService.instance.liveItems[0].end_time
        ratingLbl.text = String(LiveDataService.instance.liveItems[0].rating)
        statusLbl.text = LiveDataService.instance.liveItems[0].status
    }
}
