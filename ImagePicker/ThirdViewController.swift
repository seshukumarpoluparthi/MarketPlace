//
//  ThirdViewController.swift
//  MarketPlace
//
//  Created by apple on 8/17/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    let imagePicker = UIImagePickerController()
    @IBOutlet weak var btn_setImage: UIButton!
    @IBAction func btn_pickImage(_ sender: UIButton) {
        picUploadAlert()
    }
    
    @IBOutlet weak var view_MaskedCorner: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view_MaskedCorner.layer.cornerRadius = 20
        view_MaskedCorner.layer.borderWidth = 1
        view_MaskedCorner.layer.borderColor = UIColor.red.cgColor
        view_MaskedCorner.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMinXMinYCorner]
        
        
        
        
        
        
        
        
        
        
        
        
        btn_setImage.layer.cornerRadius = 50
        btn_setImage.layer.masksToBounds = true
        imagePicker.delegate = self
    }
    
    func picUploadAlert(){
        let alertController = UIAlertController(title: "Rancher", message: "Choose an option to upload picture", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "Gallery", style: .default) { (action:UIAlertAction) in
            self.imagePicker.allowsEditing = false
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        
        let action2 = UIAlertAction(title: "Camera", style: .default) { (action:UIAlertAction) in
            self.imagePicker.allowsEditing = false
            self.imagePicker.sourceType = .camera
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        
        let action3 = UIAlertAction(title: "Cancel", style: .destructive) { (action:UIAlertAction) in
        }
        
        alertController.addAction(action1)
        alertController.addAction(action2)
        alertController.addAction(action3)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension ThirdViewController :UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    
    
    
   @objc internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        btn_setImage.setBackgroundImage(pickedImage, for: .normal)
        //picker.dismiss(animated: true, completion: nil)
    dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}
