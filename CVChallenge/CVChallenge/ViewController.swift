//
//  ViewController.swift
//  CVChallenge
//
//  Created by Marco Tullio Braga Filho on 03/07/20.
//  Copyright © 2020 mtbfilho. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import SDWebImage

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadCatImages()
    }
    
    var catsImages = [CatsImage]()
    
    func loadCatImages() {
        let headers: HTTPHeaders = [
            "Authorization": "Client-ID 1ceddedc03a5d71"
        ]

        Alamofire
            .request("https://api.imgur.com/3/gallery/search/?q=cats", headers: headers)
            .responseObject { (response: DataResponse<CatsResponse>) in
                DispatchQueue.main.async {
                    let catsResponse = response.result.value
                    if let data = catsResponse?.data {
                        for album in data {
                            if let images = album.images {
                                for image in images {
                                    if image.type?.contains("image") ?? false {
                                        self.catsImages.append(image)
                                    }
                                }
                            }
                        }
                    }
                    
                    if !self.catsImages.isEmpty {
                        self.catsCollectionView.reloadData()
                    }
                }
            }
    }
    
    @IBOutlet weak var catsCollectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catsImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cvchallengecell", for: indexPath) as! CVChallengeCell
        let image = catsImages[indexPath.item]
        
        cell.catImage.sd_setImage(with: URL(string: image.link!))
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let image = catsImages[indexPath.item]
//        return CGSize(width: image.width ?? 100, height: image.height ?? 100)
//    }

}
