//
//  PhotoPreviewVC.swift
//  Camera
//
//  Created by Matthew Sutton on 4/10/19.
//  Copyright © 2019 Matthew Sutton. All rights reserved.
//

import UIKit

class PhotoPreviewVC: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    var previewImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoImageView.image = previewImage
    }
    
}
