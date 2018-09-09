//
//  profileCollectionViewCell.swift
//  MarketPlace
//
//  Created by apple on 8/13/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class profileCollectionViewCell: UICollectionViewCell {
    var pfbadgeImageView = UIImageView()
    
    @IBOutlet weak var img_pfImage: UIImageView!
    
    @IBOutlet weak var lbl_ProductName: UILabel!
    
    @IBOutlet weak var lbl_Cost: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
