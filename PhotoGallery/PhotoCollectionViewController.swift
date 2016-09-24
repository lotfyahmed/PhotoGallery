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

class PhotoCollectionViewController: UICollectionViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIActionSheetDelegate {
    
    private var carsImages:[UIImage?] = [UIImage(named:"car 1"),
                                         UIImage(named:"car 2"),
                                         UIImage(named:"car 3"),
                                         UIImage(named:"car 4"),
                                         UIImage(named:"car 5"),
                                         UIImage(named:"car 6")]
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
            cell.carImage.image = carsImages[indexPath.row]
        }
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        let length = (UIScreen.mainScreen().bounds.width-15)/2
        return CGSizeMake(length,length);
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath){
        if indexPath.row == carsImages.count {
            chooePhotoSheet()
        }else{
            let detailsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("DetailPhotoViewController") as! DetailPhotoViewController
            detailsViewController.carImage = carsImages[indexPath.row]
            self.navigationController?.pushViewController(detailsViewController, animated: true)
        }
    }
    
    func chooePhotoSheet(){
        let actionSheetController: UIAlertController = UIAlertController(title: "Please select Photo", message: "", preferredStyle: .ActionSheet)
        
        let cancelActionButton: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            
        }
        actionSheetController.addAction(cancelActionButton)
        
        let saveActionButton: UIAlertAction = UIAlertAction(title: "Camera", style: .Default)
        { action -> Void in
            print("Take Image by Camera")
            self.showImagePicker(.Camera)
        }
        actionSheetController.addAction(saveActionButton)
        
        let deleteActionButton: UIAlertAction = UIAlertAction(title: "Library", style: .Default)
        { action -> Void in
            print("Take Image From Gallery")
            self.showImagePicker(.Library)
        }
        actionSheetController.addAction(deleteActionButton)
        self.presentViewController(actionSheetController, animated: true, completion: nil)
    }
    
    enum PhotoSource {
        case Camera
        case Library
    }
    
    func showImagePicker(photoSource:PhotoSource){
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        switch photoSource {
        case .Camera:
            guard UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) else{
                print("There isnot Camera")
                return
            }
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        case .Library:
            guard UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) else{
                 print("There isnot Gallery")
                return
            }
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        }
        imagePicker.allowsEditing = false
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            
        })
        carsImages.append(image)
        self.collectionView?.reloadData()
    }
}
