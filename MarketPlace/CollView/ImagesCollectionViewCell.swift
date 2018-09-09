//
//  ImagesCollectionViewCell.swift
//  MarketPlace
//
//  Created by apple on 8/11/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class ImagesCollectionViewCell: UICollectionViewCell {
    let pageControl: UIPageControl = {
        let rect = CGRect(origin: .zero, size: CGSize(width: 200, height: 50))
        let pc = UIPageControl(frame: rect)
        pc.currentPage = 0
        pc.numberOfPages = 3
        pc.pageIndicatorTintColor = .gray
        pc.currentPageIndicatorTintColor = .red
        pc.isUserInteractionEnabled = false
        return pc
    }()
    
    
    @IBOutlet weak var img_Images: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.cornerRadius = 10
       // self.addSubview(pageControl)
        
        
    }

}
