//
//  UIViewController+Extensions.swift
//  Camera
//
//  Created by Matthew Sutton on 3/20/19.
//  Copyright © 2019 Matthew Sutton. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func addChildController(_ childVC: UIViewController) {
        self.addChild(childVC)
        childVC.view.frame = view.frame
        self.view.addSubview(childVC.view)
        childVC.didMove(toParent: self)
    }
}
