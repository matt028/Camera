//
//  UIImageView+Extensions.swift
//  Camera
//
//  Created by Matthew Sutton on 4/12/19.
//  Copyright © 2019 Matthew Sutton. All rights reserved.
//

import UIKit

extension UIImageView {
    
    static func imageForFilterView() -> UIImageView {
        let filterImageView = UIImageView(image: UIImage(named: "defaultImage"))
        filterImageView.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: 80, height: 80))
        filterImageView.layer.cornerRadius = 6.0
        filterImageView.layer.masksToBounds = true
        return filterImageView
    }
    
    
}
