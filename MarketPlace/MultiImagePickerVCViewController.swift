//
//  MultiImagePickerVCViewController.swift
//  MarketPlace
//
//  Created by apple on 8/17/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class MultiImagePickerVCViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    var imgpicker=UIImagePickerController()
    
    @IBOutlet weak var img_picked: UIImageView!
    
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    var pickedImages = [UIImage]()
    
    
    @IBOutlet weak var btn_Image: UIButton!
    var uploadpan_img:Data!
    var uploadpan_img_extension:String=""
    var uploadpan_img_name:String=""
    
    
    @IBAction func btn_PickImage(_ sender: UIButton) {
        setprofileimages()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagesCollectionView.delegate = self
        imagesCollectionView.dataSource = self
        imgpicker.delegate = self
        

    }
    func setprofileimages()
    {
        let alert = UIAlertController(title: "Upload Image", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        let action=UIAlertAction(title: "Gallery", style: UIAlertActionStyle.default) { (UIAlertAction) in
            self.imgpicker.delegate=self
            self.imgpicker.allowsEditing = false
            self.imgpicker.sourceType = .photoLibrary //savedPhotosAlbum and camera
            self.present(self.imgpicker, animated: true, completion: nil)
        }
        let action1=UIAlertAction(title: "Camera", style: UIAlertActionStyle.default) { (UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                self.imgpicker.delegate=self
                self.imgpicker.allowsEditing = false
                self.imgpicker.sourceType = UIImagePickerControllerSourceType.camera
                self.imgpicker.cameraCaptureMode = .photo
                self.imgpicker.modalPresentationStyle = .fullScreen
                self.present(self.imgpicker,animated: true,completion: nil)
            } else {
                self.noCamera(msg: "Sorry, this device has no camera")
            }
        }
        let action2=UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (UIAlertAction) in
        }
        alert.addAction(action)
        alert.addAction(action1)
        alert.addAction(action2)
        self.present(alert, animated: false, completion: nil)
        
    }
    @objc func noCamera(msg:String){
        let alertVC = UIAlertController(
            title: "Ranscher",
            message: msg,
            preferredStyle: .alert)
        let okAction = UIAlertAction(
            title: "OK",
            style:.default,
            handler: nil)
        alertVC.addAction(okAction)
        present(
            alertVC,
            animated: true,
            completion: nil)
    }
    // MARK:- Imagepicker
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            if picker.sourceType == .photoLibrary
            {
                let url = info[UIImagePickerControllerReferenceURL] as! NSURL
                print(pickedImage)
                print(url.lastPathComponent!)
                print(url.pathExtension!)
                uploadpan_img_extension=url.pathExtension!
                uploadpan_img_name=url.lastPathComponent!
            }
            else{
                let randomnumber=Date().timeIntervalSince1970
                print("randomnumber : \(randomnumber)")
                uploadpan_img_extension=""
                uploadpan_img_name="\(randomnumber).jpg"
            }
            let imageData = UIImageJPEGRepresentation(pickedImage, 100) as NSData?
            uploadpan_img=imageData! as Data
            
            let img=UIImage(data: imageData! as Data)
            print(img!)
            self.pickedImages.append(img!)
            if self.pickedImages.count==1
            {
                self.img_picked.image=self.pickedImages[0]
            }
            imagesCollectionView.reloadData()
            
           // btn_Image.setBackgroundImage(img, for: .normal)
            //self.btn_Image.contentMode = .scaleAspectFit
            
        }
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }


    

}

extension MultiImagePickerVCViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pickedImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upload", for: indexPath) as! UploadCollectionViewCell
        cell.img_pickedImage.image = pickedImages[indexPath.row]
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.img_picked.image = self.pickedImages[indexPath.row]
    }
    
    
}
