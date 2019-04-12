//
//  FiltersScrollView.swift
//  Camera
//
//  Created by Matthew Sutton on 4/12/19.
//  Copyright © 2019 Matthew Sutton. All rights reserved.
//

import UIKit
import CoreImage

class FiltersScrollView: UIScrollView {
    
    private var filtersService: FiltersService!
    
    init(parentView: UIView, frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        self.filtersService = FiltersService()
        setupFilters()
    }
    
    private func setupFilters() {
        
        var offset: CGFloat = 10.0
        
        for (index, filter) in FiltersService.all().enumerated() {
            let filterImageView = UIImageView.imageForFilterView()
            self.addSubview(filterImageView)
            filterImageView.tag = index
            
            filterImageView.frame.origin.x = offset
            filterImageView.center.y = self.frame.height / 2
            
            offset += filterImageView.frame.width + filterImageView.frame.width / 4
            self.contentSize = CGSize(width: offset, height: self.frame.height)
            
            self.filtersService.applyFilter(filter: filter, to: filterImageView.image!) {
                filterImageView.image = $0
            }
        }
    }
}
