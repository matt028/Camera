//
//  PhotoListCVC.swift
//  Camera
//
//  Created by Matthew Sutton on 3/20/19.
//  Copyright © 2019 Matthew Sutton. All rights reserved.
//

import UIKit
import Photos

protocol PhotoListVCDelegate {
    func photoListDidSelectImage(selectedImage: UIImage)
}

class PhotoListVCV: UICollectionViewController {
    
    private var images = [PHAsset]()
    var delegate: PhotoListVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populatePhotos()
    }
    
    private func requestPermission(completion: @escaping (PHAuthorizationStatus) -> ()) {
        PHPhotoLibrary.requestAuthorization { status in
            DispatchQueue.main.async {
                completion(status)
            }
        }
    }
    
    private func populatePhotos() {
        requestPermission { [weak self] status in
            if status == .authorized {
                let assets = PHAsset.fetchAssets(with: .image, options: nil)
                assets.enumerateObjects { (object, count, stop) in
                    self?.images.append(object)
                }
                
                self?.images.reverse()
                self?.collectionView.reloadData()
                
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCell else { fatalError("PhotoCell was not found") }
        
        let asset = images[indexPath.row]
        let manager = PHImageManager.default()
        
        manager.requestImage(for: asset, targetSize: CGSize(width: 100, height: 100), contentMode: .aspectFill, options: nil) { (image, _) in
            DispatchQueue.main.async {
                cell.photoImageView.image = image
            }
        }

        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let asset = images[indexPath.row]
        let manager = PHImageManager.default()
        
        let options = PHImageRequestOptions()
        options.isSynchronous = true
        
        manager.requestImage(for: asset, targetSize: CGSize(width: 320, height: 480), contentMode: .aspectFill, options: options) { (image, _) in
            if let image = image {
                self.delegate?.photoListDidSelectImage(selectedImage: image)
            }
        }
    }
    
}
