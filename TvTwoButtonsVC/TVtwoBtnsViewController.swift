//
//  TVtwoBtnsViewController.swift
//  MarketPlace
//
//  Created by apple on 8/20/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class TVtwoBtnsViewController: UIViewController {

    @IBOutlet weak var seshuTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        seshuTableView.delegate = self
        seshuTableView.dataSource = self
       // seshuTableView.separatorInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
       // seshuTableView.separatorInset = UIEdgeInsetsMake(10, 5, 10, 5)
        seshuTableView.reloadData()
    }
    
    
    
    
    
    @objc func CasHNavigation() {
        let stbd = UIStoryboard(name: "Main", bundle: nil)
        let vc = stbd.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.present(vc, animated: true, completion: nil)
    }
    @objc func FreeNavigation() {
        let stbd = UIStoryboard(name: "Main", bundle: nil)
        let vc = stbd.instantiateViewController(withIdentifier: "MarketPlaceProfileVC") as! MarketPlaceProfileVC
        self.present(vc, animated: true, completion: nil)
    }
}
extension TVtwoBtnsViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = seshuTableView.dequeueReusableCell(withIdentifier: "twoActions", for: indexPath) as! TwoActionsTvc
        cell.bgView.layer.shadowColor = UIColor.black.cgColor
        cell.bgView.layer.shadowOpacity = 2
        cell.bgView.layer.shadowOffset = CGSize.zero
        cell.bgView.layer.cornerRadius=10
        cell.bgView.layer.shadowRadius=4
        cell.btn_Free.tag = indexPath.row
        cell.btn_CashLbl.tag = indexPath.row
        cell.btn_Free.addTarget(self, action: #selector(FreeNavigation), for: .touchUpInside)
        cell.btn_CashLbl.addTarget(self, action: #selector(CasHNavigation), for: .touchUpInside)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
