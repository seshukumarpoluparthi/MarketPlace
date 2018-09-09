//
//  SelectFieldsVC.swift
//  MarketPlace
//
//  Created by apple on 8/14/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class SelectFieldsVC: UIViewController {
    var brandNames = ["John Deere","Apollo","Iron Bull","Dewan Euro Leopard","Dewan Foton","Dharti","Mahindra"]
    var modelNames = ["3030 NX-35 HP Tractor","3510-35 HP Tractor","3037 NX-39 HP Tractors","4010-39 HP Tractor","3230 NX - 42 HP Tractor","4510-42 HP Tractor","Mahindra 265 POWER PLUS","Mahindra 405 DI"]
    var Fueltype = ["Petrol","Diesel","Liquified petroleum gas","Biodiesel","Gasoline and kerosene"]
    var Price = ["10000","20000","30000"]

    @IBOutlet weak var chooseFieldsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        chooseFieldsTableView.delegate = self
        chooseFieldsTableView.dataSource = self
        chooseFieldsTableView.tableFooterView = UIView()
        chooseFieldsTableView.reloadData()
        self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 243/255, green: 156/255, blue: 18/255, alpha: 1)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.backgroundColor = UIColor.red
    }
    func didselectNavigate()  {
        let stbd = UIStoryboard(name: "Main", bundle: nil)
        let vc = stbd.instantiateViewController(withIdentifier: "AdvancedSearchTableViewController") as! AdvancedSearchTableViewController
        self.present(vc, animated: true, completion: nil)
    }
}
extension SelectFieldsVC : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (tableReloadPosition) {
        case 1:
            return brandNames.count
        case 2:
            return modelNames.count
        case 3:
            return Fueltype.count
        case 4:
            return Price.count
        default:
          return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chooseFieldsTableView.dequeueReusableCell(withIdentifier: "CTV", for: indexPath) as! ChooseFieldsTVC
        switch (tableReloadPosition) {
        case 1:
            cell.lbl_Title.text = brandNames[indexPath.row]
            return cell
        case 2:
            cell.lbl_Title.text = modelNames[indexPath.row]
            return cell
        case 3:
            cell.lbl_Title.text = Fueltype[indexPath.row]
            return cell
        case 4:
            cell.lbl_Title.text = Price[indexPath.row]
            return cell
        default:
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch (tableReloadPosition) {
        case 1:
            get_brand = brandNames[indexPath.row]
            self.navigationController?.popViewController(animated: true)
        case 2:
            get_model = modelNames[indexPath.row]
            self.navigationController?.popViewController(animated: true)
        case 3:
            get_fuel = Fueltype[indexPath.row]
            self.navigationController?.popViewController(animated: true)
        case 4:
            get_price = Price[indexPath.row]
            self.navigationController?.popViewController(animated: true)
        default:
            print("")
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
