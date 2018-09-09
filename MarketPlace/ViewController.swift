//
//  ViewController.swift
//  MarketPlace
//
//  Created by apple on 8/10/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var images = ["harvesting","soil","sprayer","tractor"]
    var titles = ["Tractor","Sprayer","Tillage","Harvesting"]
    let EquipmenttableView : UITableView = UITableView()
    var Equipment = ["Equipment","Land","Crop","Services"]
   
    @IBOutlet weak var txt_Search: UITextField!
    @IBOutlet weak var view_Equipment: UIView!
    @IBOutlet weak var img_Equipment: UIImageView!
    @IBOutlet weak var btn_ShowEquipment: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewIcons.delegate = self
        collectionViewIcons.dataSource = self
        machinesCollectionView.delegate = self
        machinesCollectionView.dataSource = self
        EquipmenttableView.delegate = self
        EquipmenttableView.dataSource = self
        EquipmenttableView.register(UITableViewCell.self, forCellReuseIdentifier: "equipment")
        EquipmenttableView.frame = CGRect(x: 20, y: view_Equipment.frame.size.height+view_Equipment.frame.origin.y, width: self.view.frame.size.width-40, height: 150)
        self.view.addSubview(EquipmenttableView)
        EquipmenttableView.isHidden = true
        txt_Search.leftViewMode = .always
        let imageViewText = UIImageView()
        imageViewText.frame = CGRect(x: 0, y: 0, width: 30, height: 40)
        imageViewText.contentMode = .scaleAspectFit
        imageViewText.image = UIImage(named: "gps")
       // let imageText = ""
       // imageViewText.image = imageText
        txt_Search.leftView = imageViewText
        txt_Search.delegate = self
    }
    
    
    @IBAction func btn_Equipment(_ sender: UIButton) {
        UIView.animate(withDuration: 0.4) {
            self.img_Equipment.transform=CGAffineTransform(rotationAngle: 180.0*CGFloat(Double.pi)/180.0)
        }
        
        self.EquipmenttableView.isHidden = !self.EquipmenttableView.isHidden
        
    }
    
    @IBOutlet weak var collectionViewIcons: UICollectionView!
    
    @IBOutlet weak var machinesCollectionView: UICollectionView!
    
    
    @IBAction func btn_AdvanceSearch(_ sender: UIButton) {
        
        let stbd = UIStoryboard(name: "Main", bundle: nil)
       // let vc = stbd.instantiateViewController(withIdentifier: "NavViewController") as! NavViewController
        
        let vc = stbd.instantiateViewController(withIdentifier: "NavViewController") as! NavViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func btn_Discover(_ sender: UIButton) {
        
        let stbd = UIStoryboard(name: "Main", bundle: nil)
        let vc = stbd.instantiateViewController(withIdentifier: "MarketPlaceProfileVC") as! MarketPlaceProfileVC
        self.present(vc, animated: true, completion: nil)
        
        
        
    }
    
    
    



}
extension ViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Equipment.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "equipment", for: indexPath)
        cell.textLabel?.text = Equipment[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.btn_ShowEquipment.setTitle(Equipment[indexPath.row], for: .normal)
        UIView.animate(withDuration: 0.4) {
            self.img_Equipment.transform=CGAffineTransform(rotationAngle: CGFloat(Double.pi)/180.0)
        }
        self.EquipmenttableView.isHidden = true
    }
    
    
    
    
    
}


extension ViewController :UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewIcons{
            return titles.count
        } else{
            return 6
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionViewIcons{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CCELL", for: indexPath) as! IconsCollectionViewCell
            cell.img_icon.image = UIImage(named: images[indexPath.row])
            cell.lbl_Title.text = titles[indexPath.row]
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MCELL", for: indexPath) as! MachinesCollectionViewCell
            cell.badgeImageView.frame = CGRect(x: cell.img_Machine.frame.size.width-12, y: 0, width: 30, height: 30)
            cell.badgeImageView.image = UIImage(named: "sellwhite")
            cell.badgeImageView.backgroundColor = UIColor.red
            cell.badgeImageView.layer.cornerRadius = 15
            cell.addSubview(cell.badgeImageView)
            cell.bringSubview(toFront: cell.badgeImageView)
            cell.layer.shadowColor = UIColor.gray.cgColor
            cell.layer.shadowOpacity = 2
            cell.layer.shadowOffset = CGSize(width: 1, height: 1)
            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == machinesCollectionView{
            return CGSize(width: (machinesCollectionView.frame.size.width-10)/2, height: 220)
            
            
            //220
            
        }
        else {
            return CGSize(width: (collectionViewIcons.frame.size.width-10)/4, height: 80)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        if collectionView == machinesCollectionView{
            return 10
        } else{
            return 10
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == machinesCollectionView{
            return 5
        } else {
            return 0
        }
        
    }
}
extension ViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
