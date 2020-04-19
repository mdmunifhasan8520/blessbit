//
//  DetailDataService.swift
//  BlessBit
//
//  Created by Mac PC on 4/6/20.
//  Copyright © 2020 Ticon. All rights reserved.
//

import Foundation
import Alamofire


class DetailDataService {
    static let instance = DetailDataService()
    
    
    private var youMayLikeItems = [YouMayLike]()
    private var popularVodItems = [PopularVod]()
    
    
    //MARK: Data Source
    func getYouMayLike_items() -> [YouMayLike] {
        return youMayLikeItems
    }
    func getpopularVod_items() -> [PopularVod] {
        return popularVodItems
    }
    func clearAllItems() {
        youMayLikeItems.removeAll()
        popularVodItems.removeAll()
    }
    
    //MARK:Network call
    func getDetail_itemsFromAPI(completed: @escaping DownloadComplete) {
        clearAllItems()
        AF.request(URL_DETAIL).responseJSON { response in
            //print(response.value!)
            switch response.result {
            case .success(let json):
                if let dict = response.value as? Dictionary<String, AnyObject> {
                    if let output = dict["output"] as? Dictionary<String, AnyObject> {
                        //You may also like section
                        if let youMayAlsoLike = output["youMayAlsoLike"] as? [Dictionary<String, AnyObject>]{
                            for x in 0..<youMayAlsoLike.count {
                                if let bgImg = youMayAlsoLike[x]["poster_image_1"] as? String, let title = youMayAlsoLike[x]["video_title"] as? String, let release_date = youMayAlsoLike[x]["release_date"] as? String, let duration = youMayAlsoLike[x]["duration"] as? Int, let age_limit = youMayAlsoLike[x]["age_limit"] as? String, let description = youMayAlsoLike[x]["description"] as? String,let movieURL = youMayAlsoLike[x]["Video_url"] as? String,let creator = youMayAlsoLike[x]["creator"] as? String ,let cast = youMayAlsoLike[x]["cast"] as? String {
                                    let release_date = String(release_date.prefix(4))
                                    let bgImg = URL_FOR_IMAGE + bgImg
                                    let genres = "Family"
                                    let certificate = "All"
                                    let duration = String(duration)
                                    
                                    
                                    self.youMayLikeItems.append(YouMayLike(bgImg: bgImg, title: title, release_date: release_date, age_limit: age_limit, duration: duration, description: description, genres: genres, certificate: certificate, creator: creator, cast: cast, movieURL: movieURL))
                                    
                                } //Append all objects in youMayLikeItems Array
                            } //Loop ends for all "YouMayLike" objects from API calls
                        } //get "YouMayLike" objects from API calls ends
                        
                        //PopularVod section
                        if let popularVod = output["popular"] as? [Dictionary<String, AnyObject>]{
                            for x in 0..<popularVod.count {
                                if let bgImg = popularVod[x]["poster_image_1"] as? String, let title = popularVod[x]["video_title"] as? String, let release_date = popularVod[x]["release_date"] as? String, let duration = popularVod[x]["duration"] as? Int, let age_limit = popularVod[x]["age_limit"] as? String, let description = popularVod[x]["description"] as? String ,let movieURL = popularVod[x]["Video_url"] as? String,let creator = popularVod[x]["creator"] as? String ,let cast = popularVod[x]["cast"] as? String{
                                    let release_date = String(release_date.prefix(4))
                                    let bgImg = URL_FOR_IMAGE + bgImg
                                    let genres = "Family"
                                    let certificate = "All"
                                    let duration = String(duration)
                                    
                                    
                                    
                                    self.popularVodItems.append(PopularVod(bgImg: bgImg, title: title, release_date: release_date, age_limit: age_limit, duration: duration, description: description, genres: genres, certificate: certificate, creator: creator, cast: cast, movieURL: movieURL))
                                    
                                } //Append all objects in youMayLikeItems Array
                            } //Loop ends for all "YouMayLike" objects from API calls
                        } //get "YouMayLike" objects from API calls ends
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
    } //getDetails_itemsFromAPI func ends
}



