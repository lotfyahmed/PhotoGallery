//
//  PhotoCollectionViewController.swift
//  PhotoGallery
//
//  Created by Ahmed Lotfy on 9/19/16.
//  Copyright © 2016 Ahmed Lotfy. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CarImageCell"
private let addImageIcon = "addImage"

class PhotoCollectionViewController: UICollectionViewController {
    
    var carsImages:[String] = ["car 1", "car 2", "car 3", "car 4", "car 5", "car 6", "car 1", "car 2", "car 3"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Register cell classes
        self.collectionView!.registerNib(UINib(nibName: "CarImageCell", bundle: nil), forCellWithReuseIdentifier:reuseIdentifier)
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carsImages.count + 1
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CarImageCell
        // Configure the cell
        if indexPath.row == carsImages.count {
            cell.carImage.image = UIImage(named:addImageIcon)
        }else{
            cell.carImage.image = UIImage(named:carsImages[indexPath.row])
        }
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        let length = (UIScreen.mainScreen().bounds.width-15)/2
        return CGSizeMake(length,length);
    }
}
