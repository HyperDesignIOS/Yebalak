//
//  DepositHistoryVC.swift
//  Yebalak
//
//  Created by AmrObjection on 4/16/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit

class DepositHistoryVC: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    var spinner : UIView!
    var depositsArr : [Deposit] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDepositHistory ()
        tableView.delegate = self
        tableView.dataSource = self
        spinner = self.displaySpinner(onView: self.view)
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return depositsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell")
        as! HistoryTableViewCell
        cell.dateLabel.text = depositsArr[indexPath.row].date
        cell.middelViewUpLabel.text = depositsArr[indexPath.row].merchant.nameEn
        cell.middelViewDownLabel.text = depositsArr[indexPath.row].branche.nameEn
        cell.amountLabel.text = depositsArr[indexPath.row].value
        return cell
        

    }
    

    func getDepositHistory (){
        let id = UserDefaults.standard.getUserID()
        apiRequests.apisInstance.depositeHistory(userID: "2") { (deposites) in
            self.depositsArr = deposites
            self.tableView.reloadData()
            self.removeSpinner(spinner: self.spinner)
        }
        
    }

}
