//
//  LiveDataService.swift
//  BlessBit
//
//  Created by Mac PC on 4/9/20.
//  Copyright © 2020 Ticon. All rights reserved.
//

import Foundation
import Alamofire

class LiveDataService {
    static let instance = LiveDataService()
    
    var liveItems = [Live]()
    
    //MARK:Data Source
    func getLive_items() -> [Live] {
        return liveItems
    }
    
    //MARK:Network call
    func getLive_itemsFromAPI(completed: @escaping DownloadComplete) {
        
        AF.request(URL_LIVE).responseJSON { response in
            switch response.result {
            case .success(let json):
                if let dict = response.value as? Dictionary<String, AnyObject> {
                    if let output = dict["output"] as? Dictionary<String, AnyObject> {
                        //Live Section
                        if let live = output["current_channel"] as? [Dictionary<String, AnyObject>]{
                            for x in 0..<live.count {
                                if let bgImg = live[x]["poster"] as? String, let channelName = live[x]["name"] as? String, let creation_date = live[x]["created_at"] as? String, let start_time = live[x]["start_time"] as? String, let end_time = live[x]["end_time"] as? String, let status = live[x]["status"] as? String, let rating = live[x]["rating"] as? Int, let channel_identifier = live[x]["identifier"] as? String {
                                    let creation_date = String(creation_date.prefix(4))
                                    let bgImg = URL_FOR_IMAGE + bgImg
                                    let live_url = "\(BASE_URL_FOR_LIVE_TIME)/\(channel_identifier)\(trailing)"
                                    
                                    
                                    self.liveItems.append(Live(bgImg: bgImg, channelName: channelName, creation_date: creation_date, start_time: start_time, end_time: end_time, rating: rating, status: status, channel_identifier: channel_identifier, live_url: live_url))
                                    
                                } //Append all objects in liveItems Array
                            } //Loop ends for all "Live" objects from API calls
                        } //get "live" objects from API calls ends
                        
                    } //get "output" objects from API calls ends
                } //get all objects from API calls ends
                DispatchQueue.main.async {
                    completed()
                }
            case .failure(let error):
                print(error)
                completed()
            } //switch statement ends
        } //Alamofire request ends
    } //getLive_itemsFromAPI func ends
    
}

