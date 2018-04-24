//
//  DepositHistoryVC.swift
//  Yebalak
//
//  Created by AmrObjection on 4/16/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit
import SwiftSpinner
import MOLH

class DepositHistoryVC: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    var spinner : UIView!
    var depositsArr : [Deposit] = []
    let generalMethod = GeneralMethod()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var merchantLabel: UILabel!
    
    @IBOutlet weak var NoResultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.title = NSLocalizedString("DEPOSITEHISTORY", comment: "")
    }
    
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
        apiRequests.apisInstance.depositeHistory(userID: "\(id)") { (deposites) in
            if deposites.count != 0 {
            self.depositsArr = deposites
            self.tableView.reloadData()
          //  self.removeSpinner(spinner: self.spinner)
            SwiftSpinner.hide()
            self.NoResultLabel.isHidden = true
            }
            else
            {
               
//               self.generalMethod.showAlert(title: "", message: "No data", vc:self, closure: nil)
                self.NoResultLabel.isHidden = false 
                   SwiftSpinner.hide()
            }
        }
    }
    func didLoad(){
        self.navigationItem.title = NSLocalizedString("DEPOSITEHISTORY", comment: "")
        dateLabel.text = NSLocalizedString("HISTORYDATE", comment:"")
        merchantLabel.text = NSLocalizedString("MERCHANT", comment: "")
        amountLabel.text = NSLocalizedString("AMOUNT", comment: "")
        NoResultLabel.text = NSLocalizedString("NO DATA", comment: "")
        tableView.delegate = self
        tableView.dataSource = self
        //spinner = self.displaySpinner(onView: self.view)
        if MOLHLanguage.currentAppleLanguage() == "en"{
            SwiftSpinner.show(NSLocalizedString("LOADING",comment:""))
        }
        else
        {
            SwiftSpinner.show(NSLocalizedString("LOADING",comment:""))
        }
        getDepositHistory()
    }

}
