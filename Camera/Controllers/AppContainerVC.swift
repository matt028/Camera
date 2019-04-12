//
//  AppContainerVC.swift
//  Camera
//
//  Created by Matthew Sutton on 3/20/19.
//  Copyright © 2019 Matthew Sutton. All rights reserved.
//

import UIKit

class AppContainerVC: UIViewController, PhotoListVCDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let photoListCVC = self.children.first as? PhotoListVCV else { return }
        
        photoListCVC.delegate = self
    }
    
    func photoListDidSelectImage(selectedImage: UIImage) {
        showImagePreview(previewImage: selectedImage)
    }
    
    private func showImagePreview(previewImage: UIImage) {
        guard let photoPreviewVC = self.storyboard?.instantiateViewController(withIdentifier: "PhotoPreviewVC") as? PhotoPreviewVC else { fatalError("PhotoPreviewVC not found") }
        
        photoPreviewVC.previewImage = previewImage
        self.navigationController?.pushViewController(photoPreviewVC, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let originalImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        showPhotoFiltersVC(for: originalImage)
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    private func showPhotoFiltersVC(for image: UIImage) {
        guard let photoFilterVC = self.storyboard?.instantiateViewController(withIdentifier: "PhotoFiltersVC") as? PhotoFiltersVC else { fatalError("PhotoFilterVC not found") }
        
        photoFilterVC.image = image
        self.addChildController(photoFilterVC)
    }
    
    @IBAction func cameraBtnPressed(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePickerVC = UIImagePickerController()
            imagePickerVC.sourceType = .camera
            imagePickerVC.delegate = self
            self.present(imagePickerVC, animated: true)
        }
    }
    
}
