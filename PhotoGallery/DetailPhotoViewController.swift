//
//  DetailViewController.swift
//  FruitsDiet
//
//  Created by Ravi Shankar on 30/07/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

import UIKit

class DetailPhotoViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var carName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: carName!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
