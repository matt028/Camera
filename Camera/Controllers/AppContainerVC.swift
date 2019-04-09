//
//  AppContainerVC.swift
//  Camera
//
//  Created by Matthew Sutton on 3/20/19.
//  Copyright © 2019 Matthew Sutton. All rights reserved.
//

import UIKit

class AppContainerVC: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func cameraBtnPressed(_ sender: Any) {
        guard let photosFiltersVC = storyboard?.instantiateViewController(withIdentifier: "PhotoFiltersVC") as? PhotoFiltersVC else { fatalError("PhotoFilterVC not found")}
        self.addChildController(photosFiltersVC)
    }
    
}
