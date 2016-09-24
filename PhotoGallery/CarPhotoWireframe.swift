//
//  CarPhotoWireframe.swift
//  PhotoGallery
//
//  Created by Ahmed Lotfy on 9/19/16.
//  Copyright © 2016 Ahmed Lotfy. All rights reserved.
//

import UIKit

class CarPhotoWireframe: NSObject {

    func presentCarPhotoDetails(viewController:UIViewController){
        let carPhotoDetailsViewController = carPhotoDetailsViewControllerFromStoryboard()
        viewController.presentViewController(carPhotoDetailsViewController, animated: true, completion: nil)
    }
    
    func carPhotoDetailsViewControllerFromStoryboard()-> DetailPhotoViewController{
        let storyboard = UIStoryboard(name: "main", bundle: nil)
        
        guard let detailsController = storyboard.instantiateViewControllerWithIdentifier("DetailPhotoViewController") as? DetailPhotoViewController else{
            return DetailPhotoViewController()
        }
        return detailsController
    }
}
