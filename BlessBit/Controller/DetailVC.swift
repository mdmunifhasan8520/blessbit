//
//  DetailVC.swift
//  BlessBit
//
//  Created by Mac PC on 3/31/20.
//  Copyright © 2020 Ticon. All rights reserved.
//

import UIKit
import SDWebImage
import AVKit
import AVFoundation

class DetailVC: UIViewController {
    
    let avPlayerViewController = AVPlayerViewController()
    var avPlayer: AVPlayer?
    
    var details_for_movie: Movie!
    
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var releaseLbl: UILabel!
    @IBOutlet weak var age_limit_Lbl: UILabel!
    @IBOutlet weak var duration_Lbl: UILabel!
    @IBOutlet weak var synopsisLbl: UILabel!
    @IBOutlet weak var genresLbl: UILabel!
    @IBOutlet weak var certificateLbl: UILabel!
    @IBOutlet weak var run_TimeLbl: UILabel!
    @IBOutlet weak var creatorsLbl: UILabel!
    @IBOutlet weak var castLbl: UILabel!
    
    @IBOutlet weak var youMayLikeCollection: UICollectionView!
    @IBOutlet weak var popularVodCollection: UICollectionView!
    
    @IBOutlet weak var overallPageScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateView()
        
        youMayLikeCollection.dataSource = self
        youMayLikeCollection.delegate = self
        popularVodCollection.dataSource = self
        popularVodCollection.delegate = self
        
        DetailDataService.instance.getDetail_itemsFromAPI {
            self.youMayLikeCollection.reloadData()
            self.popularVodCollection.reloadData()
        }
        
    }
    
    func changeVideoURL() {
        let movieURL: NSURL? = NSURL(string: "\(details_for_movie.movieURL)")
        if let url = movieURL {
            self.avPlayer = AVPlayer(url: url as URL)
            self.avPlayerViewController.player = self.avPlayer
        }
    }
    
    @IBAction func playVideo(_ sender: Any) {
        print("hello")
        
        self.present(self.avPlayerViewController, animated: true) {
            self.avPlayerViewController.player?.play()
        }
    }
    
    func updateView() {
        bgImage.sd_setImage(with: URL(string: "\(details_for_movie.bgImg)"))
        movieTitle.text = details_for_movie.title
        releaseLbl.text = details_for_movie.release_date
        age_limit_Lbl.text = details_for_movie.age_limit
        duration_Lbl.text = details_for_movie.duration
        synopsisLbl.text = details_for_movie.description
        genresLbl.text = details_for_movie.genres
        certificateLbl.text = details_for_movie.certificate
        run_TimeLbl.text = "\(details_for_movie.duration) m"
        creatorsLbl.text = details_for_movie.creator
        castLbl.text = details_for_movie.cast
        changeVideoURL()
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
        print("hello")
    }
}

//MARK: Data Source

extension DetailVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case youMayLikeCollection:
            return DetailDataService.instance.getYouMayLike_items().count
        case popularVodCollection:
            return DetailDataService.instance.getpopularVod_items().count
            
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UICollectionViewCell()
        
        switch collectionView {
        case youMayLikeCollection:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "YouMayLikeCell", for: indexPath) as? YouMayLikeCell {
                let youMayLike_Items = DetailDataService.instance.getYouMayLike_items()
                let youMayLike_item = youMayLike_Items[indexPath.item]
                
                cell.updateViews(youMayLike: youMayLike_item)
                
                return cell
            }
        case popularVodCollection:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularVodCell", for: indexPath) as? PopularVodCell {
                let popularVod_Items = DetailDataService.instance.getpopularVod_items()
                let popularVod_item = popularVod_Items[indexPath.item]
                
                cell.updateViews(popularVod: popularVod_item)
                return cell
            }
            
        default:
            return cell
        }
        return cell
    }
}

//MARK: Delegate
extension DetailVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var detail_youMayLike: YouMayLike!
        var detail_popularVod: PopularVod!
        //var home_Recent: Recent!
        
        switch collectionView {
        case youMayLikeCollection:
            detail_youMayLike = DetailDataService.instance.getYouMayLike_items()[indexPath.item]
            details_for_movie = detail_youMayLike
            updateView()
            
            //MARK: Animation
            UIView.animate(withDuration: 1, animations: {
                
                self.overallPageScrollView.contentOffset = CGPoint(x: 0, y: 0)
            })
        case popularVodCollection:
            detail_popularVod = DetailDataService.instance.getpopularVod_items()[indexPath.item]
            details_for_movie = detail_popularVod
            updateView()
            //MARK: Animation
            UIView.animate(withDuration: 1, animations: {
                
                self.overallPageScrollView.contentOffset = CGPoint(x: 0, y: 0)
            })
            
        default:
            print("nocell selected")
        }
    }
}
