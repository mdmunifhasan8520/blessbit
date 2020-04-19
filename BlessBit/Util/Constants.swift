//
//  Constants.swift
//  BlessBit
//
//  Created by Mac PC on 3/23/20.
//  Copyright © 2020 Ticon. All rights reserved.
//

import Foundation

let URL_HOME = "http://18.136.194.122:3000/getFront/home?country=BD"
let URL_FOR_IMAGE = "https://dxcddo4f80dxg.cloudfront.net/cms/"

let URL_DETAIL = "http://18.136.194.122:3000/getFront/detail?videoId=238&catId=28&country=BD"

let URL_LIVE = "http://18.136.194.122:3000/getFront/channel?channel_id=19&country=BD"
let BASE_URL_FOR_LIVE = "https://d3ez8lc25i6fgm.cloudfront.net/live/"

//typealias DownloadComplete = (_ slider: [Slider]) -> ()
typealias DownloadComplete = () -> ()



let timeInMiliSecDate = Date()
var timeInMiliSec = Int (timeInMiliSecDate.timeIntervalSince1970 * 1000)

let trailing = "/index.m3u8"

let BASE_URL_FOR_LIVE_TIME = "https://d3ez8lc25i6fgm.cloudfront.net/live/\(timeInMiliSec)"
