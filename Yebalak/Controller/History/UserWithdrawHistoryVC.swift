//
//  UserWithdrawHistoryVC.swift
//  Yebalak
//
//  Created by AmrObjection on 4/17/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit
import SwiftSpinner
class UserWithdrawHistoryVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var spinner : UIView!
    var userWithdraws : [Userwithdraw] = []
    let generalMethod = GeneralMethod()
    
    @IBOutlet weak var noResultLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //spinner = self.displaySpinner(onView: self.view)
        SwiftSpinner.show("loading...")
        getUserWithdrawHistory()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userWithdraws.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath) as! HistoryTableViewCell
        cell.dateLabel.text = userWithdraws[indexPath.row].date
        cell.middelViewUpLabel.text = userWithdraws[indexPath.row].phone
        cell.middelViewDownLabel.text = userWithdraws[indexPath.row].nameEn
        cell.amountLabel.text = userWithdraws[indexPath.row].value
        return cell
    }

    func getUserWithdrawHistory(){
        let id = UserDefaults.standard.getUserID()
        apiRequests.apisInstance.withdrawHistory(userID:"\(id)") { (userWithdraws) in
            if userWithdraws.count != 0 {
           self.userWithdraws = userWithdraws
            self.tableView.reloadData()
            //self.removeSpinner(spinner: self.spinner)
            self.noResultLabel.isHidden = true
            SwiftSpinner.hide()
            }
            else {
//                self.generalMethod.showAlert(title: "", message: "No data", vc:self, closure: nil)
                self.noResultLabel.isHidden = false
                SwiftSpinner.hide()
            }
        }
    }

}
