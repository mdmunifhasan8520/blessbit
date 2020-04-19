//
//  ViewController.swift
//  BlessBit
//
//  Created by Mac PC on 3/22/20.
//  Copyright © 2020 Ticon. All rights reserved.
//

import UIKit


class HomeVC: UIViewController {
    @IBOutlet weak var sliderCollection: UICollectionView!
    @IBOutlet weak var recentCollection: UICollectionView!
    @IBOutlet weak var popularCollection: UICollectionView!
    @IBOutlet weak var editorCollection: UICollectionView!
    @IBOutlet weak var movieCollection: UICollectionView!
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Release version")
        setupCollectionViewsDataSourceAndDelegate()
        
        HomeDataService.instance.getHome_itemsFromAPI {
            print("API fetching completed...")
            self.reloadCollectionViews()
        }
    }
    
    
    func setupCollectionViewsDataSourceAndDelegate() {
        sliderCollection.dataSource = self
        sliderCollection.delegate = self
        recentCollection.dataSource = self
        recentCollection.delegate = self
        popularCollection.dataSource = self
        popularCollection.delegate = self
        editorCollection.dataSource = self
        editorCollection.delegate = self
        movieCollection.dataSource = self
        movieCollection.delegate = self
    }
    
    func reloadCollectionViews() {
        self.sliderCollection.reloadData()
        self.recentCollection.reloadData()
        self.popularCollection.reloadData()
        self.editorCollection.reloadData()
        self.movieCollection.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MovieDetailVC" {
            if let detailVC = segue.destination as? DetailVC {
                if let home_Slider = sender as? Slider {
                    detailVC.details_for_movie = home_Slider
                }
                if let home_Recent = sender as? Recent {
                    //print("home_Recent \(home_Recent)")
                    detailVC.details_for_movie = home_Recent
                }
                if let home_Popular = sender as? Popular {
                    detailVC.details_for_movie = home_Popular
                }
                if let home_Editor = sender as? Editor {
                    detailVC.details_for_movie = home_Editor
                }
                if let home_Movie = sender as? Movie {
                    detailVC.details_for_movie = home_Movie
                }
            }
        }
    }
}

//MARK: Data Source
extension HomeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case sliderCollection:
            return HomeDataService.instance.getSlider_items().count
        case recentCollection:
            return HomeDataService.instance.getRecent_items().count
        case popularCollection:
            return HomeDataService.instance.getPopular_items().count
        case editorCollection:
            return HomeDataService.instance.getEditor_items().count
        case movieCollection:
            return HomeDataService.instance.getMovie_items().count
        default:
            return 0
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UICollectionViewCell()
        
        switch collectionView {
        case sliderCollection:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCell", for: indexPath) as? SliderCell {
                let slider_Items = HomeDataService.instance.getSlider_items()
                let slider_item = slider_Items[indexPath.item]
                
                cell.updateViews(slider: slider_item)
                
                return cell
            }
        case recentCollection:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecentCell", for: indexPath) as? RecentCell {
                let recent_Items = HomeDataService.instance.getRecent_items()
                let recent_item = recent_Items[indexPath.item]
                
                cell.updateViews(recent: recent_item)
                return cell
            }
        case popularCollection:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCell", for: indexPath) as? PopularCell {
                let popular_Items = HomeDataService.instance.getPopular_items()
                let popular_item = popular_Items[indexPath.item]
                
                cell.updateViews(popular: popular_item)
                return cell
            }
        case editorCollection:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EditorCell", for: indexPath) as? EditorCell {
                let editor_Items = HomeDataService.instance.getEditor_items()
                let editor_item = editor_Items[indexPath.item]
                
                cell.updateViews(editor: editor_item)
                return cell
            }
        case movieCollection:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as? MovieCell {
                let movie_Items = HomeDataService.instance.getMovie_items()
                let movie_item = movie_Items[indexPath.item]
                
                cell.updateViews(movie: movie_item)
                return cell
            }
        default:
            return cell
        }
        return cell
    }
}


//MARK: Delegate
extension HomeVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var home_Slider: Slider!
        var home_Recent: Recent!
        var home_Popular: Popular!
        var home_Editor: Editor!
        var home_Movie: Movie!
        
        switch collectionView {
        case sliderCollection:
            home_Slider = HomeDataService.instance.getSlider_items()[indexPath.item]
            self.tabBarController?.tabBar.isHidden = true
            performSegue(withIdentifier: "MovieDetailVC", sender: home_Slider)
        //print("home_Slider  \(home_Slider!)")
        case recentCollection:
            home_Recent = HomeDataService.instance.getRecent_items()[indexPath.item]
            self.tabBarController?.tabBar.isHidden = true
            performSegue(withIdentifier: "MovieDetailVC", sender: home_Recent)
        case popularCollection:
            home_Popular = HomeDataService.instance.getPopular_items()[indexPath.item]
            self.tabBarController?.tabBar.isHidden = true
            performSegue(withIdentifier: "MovieDetailVC", sender: home_Popular)
        case editorCollection:
            home_Editor = HomeDataService.instance.getEditor_items()[indexPath.item]
            self.tabBarController?.tabBar.isHidden = true
            performSegue(withIdentifier: "MovieDetailVC", sender: home_Editor)
        case movieCollection:
            home_Movie = HomeDataService.instance.getMovie_items()[indexPath.item]
            self.tabBarController?.tabBar.isHidden = true
            performSegue(withIdentifier: "MovieDetailVC", sender: home_Movie)
            self.navigationController?.presentingViewController
            
        default:
            print("nocell selected")
        }
    }
}
//MARK: UICollectionViewDelegateFlowLayout

extension HomeVC: UICollectionViewDelegateFlowLayout {
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cgSize = CGSize()
        switch collectionView {
        case sliderCollection:

                       let noOfCellsInRow = 1

                       let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

                       let totalSpace = flowLayout.sectionInset.left
                           + flowLayout.sectionInset.right
                           + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

                       let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))

                       return CGSize(width: size, height: 251)
            case recentCollection:
            let noOfCellsInRow = 4

            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

            let totalSpace = flowLayout.sectionInset.left
                + flowLayout.sectionInset.right
                + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

            let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))

            return CGSize(width: size, height: 120)
        case popularCollection:
            let noOfCellsInRow = 3

            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

            let totalSpace = flowLayout.sectionInset.left
                + flowLayout.sectionInset.right
                + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

            let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))

            return CGSize(width: size, height: size)
            case editorCollection:
                let noOfCellsInRow = 3

                let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

                let totalSpace = flowLayout.sectionInset.left
                    + flowLayout.sectionInset.right
                    + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

                let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))

                return CGSize(width: size, height: size)
         case movieCollection:
             let noOfCellsInRow = 4

             let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

             let totalSpace = flowLayout.sectionInset.left
                 + flowLayout.sectionInset.right
                 + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

             let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))

             return CGSize(width: size, height: 120)

        default:
            print("hello")

        }
        return cgSize
   }
}
