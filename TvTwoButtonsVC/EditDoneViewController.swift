//
//  EditDoneViewController.swift
//  MarketPlace
//
//  Created by apple on 8/20/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class EditDoneViewController: UIViewController {
    
    @IBOutlet var view_BottomView: UIView!
    @IBOutlet weak var btn_Archive: UIButton!
    @IBAction func btn_ArchiveTapped(_ sender: UIButton) {
        print(selected_seshu)
    }
    
    @IBOutlet weak var btn_ReadAll: UIButton!
    @IBAction func btn_ReadAllTapped(_ sender: UIButton) {
    }
    @IBOutlet weak var btn_Delete: UIButton!
    @IBAction func btn_DeleteTapped(_ sender: UIButton) {
    }
    
    
    var seshu = ["one","two","three","four","five","six","seven","eight","nine","ten","eleven","twelve","thirteen","fourteen"]
    
    var selected_seshu = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btn_edit: UIBarButtonItem!
    @IBAction func btn_editTapped(_ sender: UIBarButtonItem) {
        tableView.isEditing = !tableView.isEditing
        btn_Delete.isEnabled = false
        self.view_BottomView.isHidden = !self.view_BottomView.isHidden
        switch (tableView.isEditing) {
        case true:
            btn_edit.title = "Done"
            tableView.allowsMultipleSelection = true
            tableView.allowsSelection = true
        case false:
            btn_edit.title = "Edit"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        tableView.allowsMultipleSelection = false
        tableView.allowsSelection = false
        btn_edit.title = "Edit"
        // btn_Delete.isSelected = false
        //  btn_Delete.isHidden = true
        btn_Delete.isEnabled = false
        // when edit clicks this view appear
        view_BottomView.frame = CGRect(x: 0, y: self.view.frame.height-50, width: self.view.frame.width, height: 50)
        self.view.addSubview(view_BottomView)
        self.view_BottomView.isHidden = true
    }
}

extension EditDoneViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seshu.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EditDoneTVCell", for: indexPath) as! EditDoneTVCell
        cell.lbl_Title.text = seshu[indexPath.row]
       // cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    //reordering
//    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//        let item = seshu[sourceIndexPath.row]
//        seshu.remove(at: sourceIndexPath.row)
//        seshu.insert(item, at: destinationIndexPath.row)
//    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.btn_Delete.isEnabled = true
       // self.selected_seshu = [self.seshu[indexPath.row]]
        selected_seshu.append(seshu[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if selected_seshu.count != 0{
        selected_seshu.remove(at: indexPath.row)
    }
    }
}
