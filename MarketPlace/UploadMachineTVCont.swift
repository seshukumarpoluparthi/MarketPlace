//
//  UploadMachineTVCont.swift
//  MarketPlace
//
//  Created by apple on 8/17/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class UploadMachineTVCont: UITableViewController,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    var imgpicker=UIImagePickerController()
    var pickedImages = [UIImage]()
    var uploadpan_img:Data!
    var uploadpan_img_extension:String=""
    var uploadpan_img_name:String=""
    
    @IBOutlet weak var img_displayImage: UIImageView!
    @IBOutlet weak var collectionView_UploadImgs: UICollectionView!
    @IBOutlet weak var btn_showPlus: UIButton!
    @IBAction func btn_plus(_ sender: UIButton) {
        setprofileimages()
    }
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        textView_Description.resignFirstResponder()
    }
    
    @IBOutlet var uploadTableView: UITableView!
    private var datePickerHidden = false
    private var datePickerHidden2 = false
    
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBOutlet weak var txt_brandName: UITextField!
    @IBOutlet weak var txt_Price: UITextField!
    @IBOutlet weak var lbl_uploadDate: UILabel!
    @IBOutlet weak var datePicker_UploadDate: UIDatePicker!
    @IBAction func date_uploadDatePkr(_ sender: UIDatePicker) {
        lbl_uploadDate.text = DateFormatter.localizedString(from: datePicker_UploadDate.date, dateStyle: .short, timeStyle: .short)
        toggleDatePicker()
    }
    @IBOutlet weak var txt_Manufacturer: UITextField!
    @IBOutlet weak var txt_ModelName: UITextField!
    @IBOutlet weak var lbl_ManufacturerDate: UILabel!
    @IBOutlet weak var manufacturerDatepicker: UIDatePicker!
    @IBAction func date_ManufacturePkr(_ sender: UIDatePicker) {
        lbl_ManufacturerDate.text = DateFormatter.localizedString(from: manufacturerDatepicker.date, dateStyle: .short, timeStyle: .short)
         toggleDatePicker1()
        
    }
    private func toggleDatePicker(){
        datePickerHidden = !datePickerHidden
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    private func toggleDatePicker1(){
        datePickerHidden2 = !datePickerHidden2
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    @IBOutlet weak var lbl_FuelType: UILabel!
    @IBOutlet weak var txt_FuelTank: UITextField!
    @IBOutlet weak var txt_TotalWeight: UITextField!
    @IBOutlet weak var txt_Steering: UITextField!
    @IBOutlet weak var txt_ClutchType: UITextField!
    @IBOutlet weak var txt_Wheelstype: UITextField!
    @IBOutlet weak var txt_Color: UITextField!
    @IBOutlet weak var lbl_LoansNfinancing: UILabel!
    @IBOutlet weak var lbl_Insurance: UILabel!
    @IBOutlet weak var lbl_TransferServices: UILabel!
    @IBOutlet weak var textView_Description: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        txt_Price.delegate = self
        txt_Color.delegate = self
        txt_FuelTank.delegate = self
        txt_Steering.delegate = self
        txt_brandName.delegate = self
        txt_ModelName.delegate = self
        txt_ClutchType.delegate = self
        txt_Wheelstype.delegate = self
        txt_TotalWeight.delegate = self
        txt_Manufacturer.delegate = self
       // toggleDatePicker()
       // toggleDatePicker1()
        date_uploadDatePkr(datePicker_UploadDate)
        date_ManufacturePkr(manufacturerDatepicker)
        imgpicker.delegate = self
        collectionView_UploadImgs.delegate = self
        collectionView_UploadImgs.dataSource = self
        datePickerHidden=true
        datePickerHidden2=true
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
                self.img_displayImage.image=self.pickedImages[0]
            }
            collectionView_UploadImgs.reloadData()
            
            // btn_Image.setBackgroundImage(img, for: .normal)
            //self.btn_Image.contentMode = .scaleAspectFit
            
        }
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 20
    }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        switch (section) {
//        case 0:
//            return 0
//        default:
//            return 40
//        }
    return 40
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch (indexPath.section , indexPath.row) {
        case (0,0):
            return 250
        case (3,1):
            if datePickerHidden && indexPath.section == 3 && indexPath.row == 1{
                return 0
            } else {
                return 150
            }
        case (7,1):
            //date picker
            if datePickerHidden2 && indexPath.section == 7 && indexPath.row == 1{
                return 0
            } else {
                return 150
            }
           // return 0
        // return 150
        case (19,0):
            return 150
        default:
            return 50
        }
        //  return 50
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch (indexPath.section , indexPath.row) {
        case (3,0):
            toggleDatePicker()
        case (7,0):
            toggleDatePicker1()
        
        default:
            ()
        }
    }
}


extension UploadMachineTVCont : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pickedImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView_UploadImgs.dequeueReusableCell(withReuseIdentifier: "uploadImage", for: indexPath) as! UploadMachinbeCVCell
        cell.img_Machine.image = pickedImages[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.img_displayImage.image = self.pickedImages[indexPath.row]
    }
}
