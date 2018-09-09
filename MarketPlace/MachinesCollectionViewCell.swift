//
//  MachinesCollectionViewCell.swift
//  MarketPlace
//
//  Created by apple on 8/10/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class MachinesCollectionViewCell: UICollectionViewCell {
    var badgeImageView = UIImageView()
    @IBOutlet weak var img_Machine: UIImageView!
    @IBOutlet weak var lbl_MacName: UILabel!
    @IBOutlet weak var view_collection: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        view_collection.layer.shadowColor = UIColor.red.cgColor
//        view_collection.layer.shadowOpacity = 0.9
//        view_collection.layer.shadowOffset = CGSize(width: 0, height: 1)
        
        
        
        
    }

}
