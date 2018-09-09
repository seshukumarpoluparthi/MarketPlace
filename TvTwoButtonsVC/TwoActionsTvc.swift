//
//  TwoActionsTvc.swift
//  MarketPlace
//
//  Created by apple on 8/20/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class TwoActionsTvc: UITableViewCell {
    
    
    @IBOutlet weak var bgView: UIView!
    @IBAction func btn_Cash(_ sender: UIButton) {
    }
    
    
    @IBOutlet weak var btn_CashLbl: UIButton!
    @IBOutlet weak var btn_Free: UIButton!
    
    @IBAction func btn_CashTapped(_ sender: UIButton) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
