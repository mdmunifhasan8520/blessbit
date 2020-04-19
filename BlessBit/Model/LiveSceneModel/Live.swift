//
//  Live.swift
//  BlessBit
//
//  Created by Mac PC on 4/9/20.
//  Copyright © 2020 Ticon. All rights reserved.
//

import Foundation

class Live {
    public var bgImg: String
    public var channelName: String
    public var creation_date: String
    public var start_time: String
    public var end_time: String
    public var rating: Int
    public var status: String
    public var channel_identifier : String
    public var live_url: String
    
    //Initialization
    init(bgImg:String, channelName:String, creation_date:String,start_time:String,end_time:String,rating:Int,status:String,channel_identifier:String,live_url:String){
        self.bgImg = bgImg
        self.channelName = channelName
        self.creation_date = creation_date
        self.start_time = start_time
        self.end_time = end_time
        self.rating = rating
        self.status = status
        self.channel_identifier = channel_identifier
        self.live_url = live_url
        
    }
}


