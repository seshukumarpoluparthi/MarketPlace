//
//  AdvancedSearchTableViewController.swift
//  MarketPlace
//


import UIKit
class AdvancedSearchTableViewController: UITableViewController {
    private var datePickerHidden = true
    @IBOutlet var ASTableView: UITableView!
    @IBOutlet weak var fromDate: UILabel!
    @IBOutlet weak var lbl_toDate: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var lbl_GetBrandName: UILabel!
    @IBOutlet weak var lbl_GetModelName: UILabel!
    @IBOutlet weak var lbl_FuelType: UILabel!
    @IBOutlet weak var lbl_PriceFrom: UILabel!
    @IBAction func didChangeDate(_ sender: UIDatePicker) {
        lbl_toDate.text = DateFormatter.localizedString(from: datePicker.date, dateStyle: .short, timeStyle: .short)
        fromDate.text = DateFormatter.localizedString(from: datePicker.date, dateStyle: .short, timeStyle: .short)
        toggleDatePicker()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // let indexPath = tableView.indexPathForSelectedRow
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        didChangeDate(datePicker)
        toggleDatePicker()
        // navigation bar
        // navigationController?.navigationBar.prefersLargeTitles = true
        // let sc = UISearchController(searchResultsController: nil)
        // navigationItem.searchController = sc
        self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 243/255, green: 156/255, blue: 18/255, alpha: 1)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.backgroundColor = UIColor.red
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        lbl_GetBrandName.text = get_brand
        lbl_GetModelName.text = get_model
        lbl_FuelType.text = get_fuel
        lbl_PriceFrom.text = get_price
    }
    private func toggleDatePicker() {
        datePickerHidden = !datePickerHidden
        // Force table to update its contents
        ASTableView.beginUpdates()
        ASTableView.endUpdates()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch (section) {
        case 0:
            return 0
        default:
            return 50
        }
        //return 50
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch (indexPath.section , indexPath.row) {
        case (1,0):
            toggleDatePicker()
        case (0,0):
            //brand name
            tableReloadPosition = 1
        case (0,1):
            //model name
            tableReloadPosition = 2
        case (0,2):
            //fuel name
            tableReloadPosition = 3
        case (2,0):
            //price name
            tableReloadPosition = 4
        default:
            ()
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch (indexPath.section , indexPath.row) {
        
        case (1,1):
            if datePickerHidden && indexPath.section == 1 && indexPath.row == 1{
                return 0
            } else {
                return 150
                // return 50
               // return super.tableView(tableView, heightForRowAt: indexPath)
            }
          //  return 150
        default:
            return 50
        }
        
//        if datePickerHidden && indexPath.section == 1 && indexPath.row == 1{
//            return 0
//        } else {
//           // return 50
//        return super.tableView(tableView, heightForRowAt: indexPath)
//        }
    }
}

