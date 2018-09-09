//
//  DisplayMachineDetailsVC.swift
//  MarketPlace
//
//  Created by apple on 8/18/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class DisplayMachineDetailsVC: UIViewController {
    @IBOutlet weak var wholeScrollView: UIScrollView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var view_eye: UIView!
    @IBOutlet weak var view_chat: UIView!
    @IBOutlet weak var view_cart: UIView!
    
    var pageControl=UIPageControl()
    var images : [String] = ["tractor-1","sprayer-1","Rectangle 4 copy"]
    var frame = CGRect(x: 0, y: 0, width:0, height: 0)
    var pagecount : Int = 0
    var NotibadgeButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        addBadges()
        pageControl = UIPageControl(frame: CGRect(x: 0, y: scrollView.frame.origin.y+scrollView.frame.size.height-30, width: scrollView.frame.size.width, height: 40))
        pageControl.tintColor = UIColor.red
        pageControl.pageIndicatorTintColor = UIColor.black
        pageControl.currentPageIndicatorTintColor = UIColor.green
        pageControl.numberOfPages = images.count
        self.wholeScrollView.addSubview(pageControl)
        var x_postion:CGFloat=0
        for index in 0..<images.count{
            frame.origin.x = scrollView.frame.size.width * CGFloat(index)
            frame.size = scrollView.frame.size
            let imgView = UIImageView(frame: CGRect(x: x_postion, y: 0, width: self.view.frame.size.width, height: scrollView.frame.size.height))
            x_postion=imgView.frame.origin.x+imgView.frame.size.width
            imgView.image = UIImage(named: images[index])
            imgView.clipsToBounds = true
            imgView.contentMode = .scaleAspectFit
            self.scrollView.addSubview(imgView)
        }
        scrollView.contentSize = CGSize(width: ((self.view.frame.size.width) * CGFloat(images.count)), height: scrollView.frame.size.height)
        scrollView.delegate = self
        Timer_pageviewcontroller()
    }
    func Timer_pageviewcontroller()
    {
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(TimeAction11), userInfo: nil, repeats: true)
    }
    @objc func TimeAction11()
    {
        DispatchQueue.main.async {
            let x = CGFloat(self.pagecount) * self.scrollView.frame.size.width
            self.pageControl.currentPage=self.pagecount
            self.pagecount=self.pagecount+1
            if self.pagecount==self.images.count
            {
                self.pagecount=0
            }
            self.scrollView.contentOffset.x=x
        }
    }
    
    func addBadges(){
        
        view_eye.backgroundColor = UIColor.orange
        view_eye.layer.cornerRadius = view_eye.frame.size.height/2
        view_cart.backgroundColor = UIColor.orange
        view_cart.layer.cornerRadius = view_cart.frame.size.height/2
        view_chat.layer.cornerRadius = view_chat.frame.size.height/2
        view_chat.backgroundColor = UIColor.orange
        
        NotibadgeButton.frame = CGRect(x: view_eye.frame.size.width-15, y: -5, width: 25, height: 25)
        NotibadgeButton.layer.cornerRadius = 12.5
        NotibadgeButton.setTitle("25", for: .normal)
        NotibadgeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        NotibadgeButton.setTitleColor(UIColor.white, for: .normal)
        NotibadgeButton.backgroundColor = UIColor.orange
        NotibadgeButton.layer.borderColor = UIColor.white.cgColor
        NotibadgeButton.layer.borderWidth = 2
        self.view_eye.addSubview(NotibadgeButton)
        self.scrollView.bringSubview(toFront: NotibadgeButton)
    }
}
extension DisplayMachineDetailsVC : UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        self.pageControl.currentPage=self.pagecount
        if pageControl.numberOfPages<Int(pageNumber)
        {
            pageControl.currentPage = Int(pageNumber)
        }
    }
}






