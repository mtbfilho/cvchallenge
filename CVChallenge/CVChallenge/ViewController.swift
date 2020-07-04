//
//  ViewController.swift
//  CVChallenge
//
//  Created by Marco Tullio Braga Filho on 03/07/20.
//  Copyright © 2020 mtbfilho. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadCatImages()
    }
    
    func loadCatImages() {
        let headers: HTTPHeaders = [
            "Authorization": "Client-ID 1ceddedc03a5d71"
        ]

        Alamofire.request("https://api.imgur.com/3/gallery/search/?q=cats", headers: headers).responseJSON { response in
            debugPrint(response)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "cvchallengecell", for: indexPath)
    }

}
