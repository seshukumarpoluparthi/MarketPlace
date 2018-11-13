//
//  ViewsViewController.swift
//  MarketPlace
//
//  Created by apple on 8/15/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class ViewsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        NSLog("view will appear is running")
    }
    override func viewWillDisappear(_ animated: Bool) {
        NSLog("viewWillDisappear is running")
    }
    override func viewDidAppear(_ animated: Bool) {
        NSLog("viewDidAppear is running")
    }
    override func viewDidDisappear(_ animated: Bool) {
        NSLog("viewDidDisappear is running")
    }
 
}
