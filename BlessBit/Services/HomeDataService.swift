//
//  DataService.swift
//  BlessBit
//
//  Created by Mac PC on 3/23/20.
//  Copyright © 2020 Ticon. All rights reserved.
//

import Foundation
import Alamofire

class HomeDataService {
    static let instance = HomeDataService()
    
    private var sliderItems = [Slider]()
    private var recentItems = [Recent]()
    private var popularItems = [Popular]()
    private var editorItems = [Editor]()
    private var movieItems = [Movie]()
    
    //MARK: Data Source
    func getSlider_items() -> [Slider] {
        return sliderItems
    }
    func getRecent_items() -> [Recent] {
        return recentItems
    }
    func getPopular_items() -> [Popular] {
        return popularItems
    }
    func getEditor_items() -> [Editor] {
        return editorItems
    }
    func getMovie_items() -> [Movie] {
        return movieItems
    }
    func clearAllItems() {
        sliderItems.removeAll()
        recentItems.removeAll()
        popularItems.removeAll()
        editorItems.removeAll()
        movieItems.removeAll()
    }
    //MARK:Network call
    func getHome_itemsFromAPI(completed: @escaping DownloadComplete) {
        clearAllItems() //call this function is not mendatory in this VC
        AF.request(URL_HOME).responseJSON { response in
            //print(response.value!)
            switch response.result {
            case .success(let json):
                if let dict = response.value as? Dictionary<String, AnyObject> {
                    if let output = dict["output"] as? Dictionary<String, AnyObject> {
                        //header slider
                        if let slider = output["slider"] as? [Dictionary<String, AnyObject>]{
                            for x in 0..<slider.count {
                                if let bgImg = slider[x]["banner_image"] as? String, let title = slider[x]["title"] as? String, let release_date = slider[x]["release_date"] as? String, let duration = slider[x]["duration"] as? String, let age_limit = slider[x]["age_limit"] as? String, let description = slider[x]["description"] as? String {
                                    let release_date = String(release_date.prefix(4))
                                    let bgImg = URL_FOR_IMAGE + bgImg
                                    let genres = "Family"
                                    let certificate = "All"
                                    let creator = ""
                                    let cast = ""
                                    let movieURL = ""
                                    self.sliderItems.append(Slider(bgImg: bgImg, title: title, release_date: release_date, age_limit: age_limit, duration: duration, description: description, genres: genres, certificate: certificate, creator: creator, cast: cast, movieURL: movieURL))
                                    // print(self.sliderItems)
                                    //print("slider bgImg \(bgImg)")
                                } //Append all objects in sliderItems Array
                            } //Loop ends for all "slider" objects from API calls
                        } //get "slider" objects from API calls ends
                        //recent VOD
                        if let recent = output["list-video-recent-2"] as? [Dictionary<String, AnyObject>]{
                            for x in 0..<recent.count {
                                if let bgImg = recent[x]["poster_image_1"] as? String,let title = recent[x]["video_title"] as? String, let release_date = recent[x]["release_date"] as? String, let duration = recent[x]["duration"] as? Int, let age_limit = recent[x]["age_limit"] as? String, let description = recent[x]["description"] as? String,let creator = recent[x]["creator"] as? String,let cast = recent[x]["cast"] as? String,let movieURL = recent[x]["Video_url"] as? String {
                                    //print("Title for slider first item \(title)")
                                    let bgImg = URL_FOR_IMAGE + bgImg
                                    let release_date = String(release_date.prefix(4))
                                    let duration = String(duration)
                                    //print("recent bgImg \(recent)")
                                    let genres = "Family"
                                    let certificate = "All"
                                    
                                    self.recentItems.append(Recent(bgImg: bgImg, title: title, release_date: release_date, age_limit: age_limit, duration: duration, description: description, genres: genres, certificate: certificate, creator: creator, cast: cast, movieURL: movieURL))
                                    
                                } //Append all objects in recentItems Array
                            }//Loop ends for all "recent" objects from API calls
                        } //get "recent" objects from API calls ends
                        //Popular VOD
                        if let popular = output["list-video-popular-3"] as? [Dictionary<String, AnyObject>]{
                            for x in 0..<popular.count {
                                if let bgImg = popular[x]["poster_image_1"] as? String, let title = popular[x]["video_title"] as? String, let release_date = popular[x]["release_date"] as? String, let duration = popular[x]["duration"] as? Int, let age_limit = popular[x]["age_limit"] as? String, let description = popular[x]["description"] as? String,let creator = popular[x]["creator"] as? String,let cast = popular[x]["cast"] as? String ,let movieURL = popular[x]["Video_url"] as? String  {
                                    let release_date = String(release_date.prefix(4))
                                    let bgImg = URL_FOR_IMAGE + bgImg
                                    let duration = String(duration)
                                    let genres = "Family"
                                    let certificate = "All"
                                    
                                    self.popularItems.append(Popular(bgImg: bgImg, title: title, release_date: release_date, age_limit: age_limit, duration: duration, description: description, genres: genres, certificate: certificate, creator: creator, cast: cast, movieURL: movieURL))
                                    
                                } //Append all objects in popularItems Array
                            } //Loop ends for all "slider" objects from API calls
                        }
                        //Editor's Picks
                        if let editor = output["list-video-editor-4"] as? [Dictionary<String, AnyObject>]{
                            for x in 0..<editor.count {
                                if let bgImg = editor[x]["poster_image_1"] as? String, let title = editor[x]["video_title"] as? String, let release_date = editor[x]["release_date"] as? String, let duration = editor[x]["duration"] as? Int, let age_limit = editor[x]["age_limit"] as? String, let description = editor[x]["description"] as? String,let creator = editor[x]["creator"] as? String,let cast = editor[x]["cast"] as? String,let movieURL = editor[x]["Video_url"] as? String  {
                                    let release_date = String(release_date.prefix(4))
                                    let bgImg = URL_FOR_IMAGE + bgImg
                                    let duration = String(duration)
                                    let genres = "Family"
                                    let certificate = "All"
                                    
                                    
                                    self.editorItems.append(Editor(bgImg: bgImg, title: title, release_date: release_date, age_limit: age_limit, duration: duration, description: description, genres: genres, certificate: certificate, creator: creator, cast: cast, movieURL: movieURL))
                                    
                                } //Append all objects in popularItems Array
                            } //Loop ends for all "slider" objects from API calls
                        }
                        //Movies
                        if let movies = output["list-video-Movies-5"] as? [Dictionary<String, AnyObject>]{
                            for x in 0..<movies.count {
                                if let bgImg = movies[x]["poster_image_1"] as? String, let title = movies[x]["video_title"] as? String, let release_date = movies[x]["release_date"] as? String, let duration = movies[x]["duration"] as? Int, let age_limit = movies[x]["age_limit"] as? String, let description = movies[x]["description"] as? String,let creator = movies[x]["creator"] as? String,let cast = movies[x]["cast"] as? String,let movieURL = movies[x]["Video_url"] as? String {
                                    let release_date = String(release_date.prefix(4))
                                    let bgImg = URL_FOR_IMAGE + bgImg
                                    let duration = String(duration)
                                    let genres = "Family"
                                    let certificate = "All"
                                    
                                    self.movieItems.append(Movie(bgImg: bgImg, title: title, release_date: release_date, age_limit: age_limit, duration: duration, description: description, genres: genres, certificate: certificate, creator: creator, cast: cast, movieURL: movieURL))
                                    
                                } //Append all objects in popularItems Array
                            } //Loop ends for all "slider" objects from API calls
                        }
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
    } //getHome_itemsFromAPI func ends
} //Data Service class ends


