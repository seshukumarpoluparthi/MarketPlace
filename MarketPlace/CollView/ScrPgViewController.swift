//
//  ScrPgViewController.swift
//  MarketPlace
//
//  Created by apple on 8/11/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class ScrPgViewController: UIViewController {
    @IBOutlet weak var imgcollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imgcollectionView.delegate = self
        imgcollectionView.dataSource = self
    }
    
    @objc func navigateVc(){
        
        let stbd = UIStoryboard(name: "Main", bundle: nil)
        let vc = stbd.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.present(vc, animated: true, completion: nil)
        
    }
    
    
}
extension ScrPgViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CCELL1", for: indexPath) as! ImagesCollectionViewCell
        cell.layer.borderColor = UIColor.red.cgColor
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if (kind == UICollectionElementKindSectionFooter){
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CRV", for: indexPath) as! ImagesCollectionReusableView
            
            //  footer.isUserInteractionEnabled  = true
            
            
            footer.tag = indexPath.section
            let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(navigateVc))
            footer.addGestureRecognizer(tapGestureRecognizer)
            
            
            
            return footer
        }
        fatalError()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let stbd = UIStoryboard(name: "Main", bundle: nil)
        let vc = stbd.instantiateViewController(withIdentifier: "AdvancedSearchTableViewController") as! AdvancedSearchTableViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
}

