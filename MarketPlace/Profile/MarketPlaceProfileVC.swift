//
//  MarketPlaceProfileVC.swift
//  MarketPlace
//
//  Created by apple on 8/13/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class MarketPlaceProfileVC: UIViewController {
    var NotibadgeButton = UIButton()
    var chatBadgeButton = UIButton()
    var sellBadgeButton = UIButton()
    var buyBadgeButton = UIButton()
   // var segment_position : Int = 1
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var mpPfCollectionView: UICollectionView!
    @IBOutlet weak var view_Notification: UIView!
    @IBOutlet weak var img_Notification: UIImageView!
    @IBOutlet weak var view_Chat: UIView!
    @IBOutlet weak var img_Chat: UIImageView!
    @IBOutlet weak var view_Sell: UIView!
    @IBOutlet weak var img_Sell: UIImageView!
    @IBOutlet weak var view_Buy: UIView!
    @IBOutlet weak var img_Buy: UIImageView!
    @IBAction func seg_IndexChanged(_ sender: UISegmentedControl) {
      //  self.segment_position = segmentedControl.selectedSegmentIndex
        switch (segmentedControl.selectedSegmentIndex) {
        case 0:
           // self.view.backgroundColor = UIColor.green
            self.mpPfCollectionView.reloadData()
        case 1:
            self.mpPfCollectionView.reloadData()
           // self.view.backgroundColor = UIColor.orange
        default:
            self.mpPfCollectionView.reloadData()
            //self.view.backgroundColor = UIColor.gray
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addBadges()
        mpPfCollectionView.delegate = self
        mpPfCollectionView.dataSource = self
        mpPfCollectionView.reloadData()
        segmentedControl.layer.cornerRadius = 20
        segmentedControl.layer.masksToBounds = true
        segmentedControl.layer.borderWidth = 0.5
        segmentedControl.layer.borderColor = UIColor.lightGray.cgColor
        segmentedControl.titleTextAttributes(for: UIControlState.normal)
     //  let font = UIFont.systemFont(ofSize: 22)
        let font = UIFont.boldSystemFont(ofSize: 20)
        segmentedControl.setTitleTextAttributes([NSAttributedStringKey.font: font], for: .normal)
    }
    
    func addBadges(){
        // notification badge
        NotibadgeButton.frame = CGRect(x: view_Notification.frame.size.width-15, y: -5, width: 25, height: 25)
        NotibadgeButton.layer.cornerRadius = 12.5
        NotibadgeButton.setTitle("25", for: .normal)
        NotibadgeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        NotibadgeButton.setTitleColor(UIColor.white, for: .normal)
        NotibadgeButton.backgroundColor = UIColor.orange
        NotibadgeButton.layer.borderColor = UIColor.white.cgColor
        NotibadgeButton.layer.borderWidth = 2
        self.view_Notification.addSubview(NotibadgeButton)
        self.view.bringSubview(toFront: NotibadgeButton)
        //chat badge
        chatBadgeButton.frame = CGRect(x: view_Notification.frame.size.width-15, y: -5, width: 25, height: 25)
        chatBadgeButton.layer.cornerRadius = 12.5
        chatBadgeButton.setTitle("25", for: .normal)
        chatBadgeButton.titleLabel?.textColor = UIColor.white
        //chatBadgeButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        chatBadgeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        chatBadgeButton.backgroundColor = UIColor.orange
        chatBadgeButton.layer.borderColor = UIColor.white.cgColor
        chatBadgeButton.layer.borderWidth = 2
        self.view_Chat.addSubview(chatBadgeButton)
        self.view.bringSubview(toFront: chatBadgeButton)
        // sell badge
        sellBadgeButton.frame = CGRect(x: view_Notification.frame.size.width-15, y: -5, width: 25, height: 25)
        sellBadgeButton.layer.cornerRadius = 12.5
        sellBadgeButton.setTitle("25", for: .normal)
        sellBadgeButton.titleLabel?.textColor = UIColor.white
        sellBadgeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        sellBadgeButton.layer.borderColor = UIColor.white.cgColor
        sellBadgeButton.layer.borderWidth = 2
        sellBadgeButton.backgroundColor = UIColor.orange
        self.view_Sell.addSubview(sellBadgeButton)
        self.view.bringSubview(toFront: sellBadgeButton)
        // buy badge
        buyBadgeButton.frame = CGRect(x: view_Notification.frame.size.width-15, y: -5, width: 25, height: 25)
        buyBadgeButton.setTitle("25", for: .normal)
        buyBadgeButton.titleLabel?.textColor = UIColor.white
        buyBadgeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        buyBadgeButton.layer.cornerRadius = 12.5
        buyBadgeButton.backgroundColor = UIColor.orange
        buyBadgeButton.layer.borderColor = UIColor.white.cgColor
        buyBadgeButton.layer.borderWidth = 2
        self.view_Buy.addSubview(buyBadgeButton)
        self.view.bringSubview(toFront: buyBadgeButton)
    }
    
}

extension MarketPlaceProfileVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            let cell = mpPfCollectionView.dequeueReusableCell(withReuseIdentifier: "PCELL", for: indexPath) as! profileCollectionViewCell
            cell.img_pfImage.image = UIImage(named: "sprayer-1")
            cell.lbl_ProductName.text = "STIHL SG 20 Backpower Sprayer"
            cell.lbl_Cost.text = "$125.95"
            cell.pfbadgeImageView.frame = CGRect(x: cell.frame.size.width-30, y: 0, width: 25, height: 25)
            cell.pfbadgeImageView.layer.cornerRadius = 12.5
            cell.addSubview(cell.pfbadgeImageView)
            cell.bringSubview(toFront: cell.pfbadgeImageView)
            //   cell.pfbadgeImageView.frame = CGRect(x: cell.img_pfImage.frame.size.width+15, y: 0, width: 30, height: 30)
            cell.pfbadgeImageView.image = UIImage(named: "sellwhite")
            cell.pfbadgeImageView.backgroundColor = UIColor.red
            // cell.pfbadgeImageView.layer.cornerRadius = 15
            //  cell.addSubview(cell.pfbadgeImageView)
            //  cell.bringSubview(toFront: cell.pfbadgeImageView)
            cell.layer.shadowColor = UIColor.gray.cgColor
            cell.layer.shadowOpacity = 2
            cell.layer.shadowOffset = CGSize(width: 1, height: 1)
            return cell
        case 1:
            let cell = mpPfCollectionView.dequeueReusableCell(withReuseIdentifier: "PCELL", for: indexPath) as! profileCollectionViewCell
            cell.img_pfImage.image = UIImage(named: "tractor-1")
            cell.lbl_Cost.text = "$ 2,586 / 3,000"
            cell.lbl_ProductName.text = "John Deere AutoTrac"
            
            cell.pfbadgeImageView.frame = CGRect(x: cell.frame.size.width-30, y: 0, width: 25, height: 25)
            cell.pfbadgeImageView.layer.cornerRadius = 12.5
            cell.addSubview(cell.pfbadgeImageView)
            cell.bringSubview(toFront: cell.pfbadgeImageView)
            //   cell.pfbadgeImageView.frame = CGRect(x: cell.img_pfImage.frame.size.width+15, y: 0, width: 30, height: 30)
            cell.pfbadgeImageView.image = UIImage(named: "buywhite")
            cell.pfbadgeImageView.backgroundColor = UIColor.red
            // cell.pfbadgeImageView.layer.cornerRadius = 15
            //  cell.addSubview(cell.pfbadgeImageView)
            //  cell.bringSubview(toFront: cell.pfbadgeImageView)
            cell.layer.shadowColor = UIColor.gray.cgColor
            cell.layer.shadowOpacity = 2
            cell.layer.shadowOffset = CGSize(width: 1, height: 1)
            return cell
            
        default:
            let cell = mpPfCollectionView.dequeueReusableCell(withReuseIdentifier: "PCELL", for: indexPath) as! profileCollectionViewCell
            cell.img_pfImage.image = UIImage(named: "sprayer-1")
            cell.pfbadgeImageView.frame = CGRect(x: cell.frame.size.width-30, y: 0, width: 25, height: 25)
            cell.pfbadgeImageView.layer.cornerRadius = 12.5
            cell.addSubview(cell.pfbadgeImageView)
            cell.bringSubview(toFront: cell.pfbadgeImageView)
            //   cell.pfbadgeImageView.frame = CGRect(x: cell.img_pfImage.frame.size.width+15, y: 0, width: 30, height: 30)
            cell.pfbadgeImageView.image = UIImage(named: "sellwhite")
            cell.pfbadgeImageView.backgroundColor = UIColor.red
            // cell.pfbadgeImageView.layer.cornerRadius = 15
            //  cell.addSubview(cell.pfbadgeImageView)
            //  cell.bringSubview(toFront: cell.pfbadgeImageView)
            cell.layer.shadowColor = UIColor.gray.cgColor
            cell.layer.shadowOpacity = 2
            cell.layer.shadowOffset = CGSize(width: 1, height: 1)
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: (mpPfCollectionView.frame.size.width-10)/2, height: 210)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 5
    }
}
