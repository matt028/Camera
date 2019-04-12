//
//  FilterService.swift
//  Camera
//
//  Created by Matthew Sutton on 4/12/19.
//  Copyright © 2019 Matthew Sutton. All rights reserved.
//

import UIKit
import CoreImage

class FiltersService {
    
    private var context: CIContext
    
    init() {
        self.context = CIContext()
    }
    
    func applyFilter(filter: CIFilter, to inputImage: UIImage, completion: @escaping ((UIImage) -> () )) {
        
        let sourceImage = CIImage(image: inputImage)!
        filter.setValue(sourceImage, forKey: kCIInputImageKey)
        
        if let cgImg = self.context.createCGImage(filter.outputImage!, from: filter.outputImage!.extent) {
            let processedImage = UIImage(cgImage: cgImg, scale: inputImage.scale, orientation: inputImage.imageOrientation)
            completion(processedImage)
        }
    }
    
    static func all() -> [CIFilter] {
        // blur
        let blurFilter = CIFilter(name: "CIGaussianBlur")!
        blurFilter.setValue(5.0, forKey: kCIInputRadiusKey)
        
        // halftone
        let halfToneFilter = CIFilter(name: "CICMYKHalftone")!
        halfToneFilter.setValue(5.0, forKey: kCIInputWidthKey)
        
        // crystallize
        let crystallizeFilter = CIFilter(name: "CICrystallize")!
        crystallizeFilter.setValue(5, forKey: kCIInputRadiusKey)
        
        // monochrome
        let monochromeFilter = CIFilter(name: "CIColorMonochrome")!
        monochromeFilter.setValue(CIColor(red: 0.7, green: 0.7, blue: 0.7), forKey: kCIInputColorKey)
        monochromeFilter.setValue(10, forKey: kCIInputIntensityKey)
        
        // sepia
        let sepiaFilter = CIFilter(name: "CISepiaTone")!
        sepiaFilter.setValue(10, forKey: kCIInputIntensityKey)
        
        return [blurFilter, halfToneFilter, crystallizeFilter, monochromeFilter, sepiaFilter]
        
    }
}
