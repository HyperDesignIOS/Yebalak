//
//  ViewController.swift
//  Yebalak
//
//  Created by AmrObjection on 4/10/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit
import SwiftSpinner
class BalanceViewController: UIViewController {
    
    var balance : String!
    var lastTransaction :String!
    var date : String!
    var spinner : UIView!
    var user : User!

    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var lastTransactionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var balanceImageLabel: UILabel!
    @IBOutlet weak var balanceLbl: UILabel!
    @IBOutlet weak var last: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var coinLbl: UILabel!
    @IBOutlet weak var historyLbl: UILabel!
    @IBOutlet weak var settingLbl: UILabel!
    @IBOutlet weak var withdrawLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        balanceLbl.text = NSLocalizedString("BALANCE", comment: "")
         last.text = NSLocalizedString("LAST TRANSACTION", comment: "")
          dateLbl.text = NSLocalizedString("DATE", comment: "")
        coinLbl.text = NSLocalizedString("COIN", comment: "")
          historyLbl.text = NSLocalizedString("HISTORY", comment: "")
        withdrawLbl.text = NSLocalizedString("WITHDRAW", comment: "")
         settingLbl.text = NSLocalizedString("SETTING", comment: "")
        self.navigationItem.title = NSLocalizedString("BALANCENAV", comment: "")
        
        SwiftSpinner.show("loading...")
       // spinner = self.displaySpinner(onView: self.view)
        let id = UserDefaults.standard.getUserID()
        apiRequests.apisInstance.getUserBalance(userId: "\(id)") { (user, balance, date, last) in
            //self.removeSpinner(spinner: self.spinner)
            SwiftSpinner.hide()
            self.balanceLabel.text = balance
            self.lastTransactionLabel.text = last
            self.dateLabel.text = date
            self.balanceImageLabel.text = balance
            self.user = user
            let encodedData = NSKeyedArchiver.archivedData(withRootObject: user)
            UserDefaults.standard.setUser(value: encodedData)
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func withdrawButton(_ sender: Any)
    {
        let storyboard = UIStoryboard(name: "Withdraw", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "WithdrawImagesID")
      //  self.navigationController?.pushViewController(controller, animated: true)
       self.show(controller, sender: self)
      
    }
    
    @IBAction func historyButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "History", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "HistoryID")
        self.show(controller, sender: self)
    }
    
    @IBAction func settingButton(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "EditProfile", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "EditProfileID")
        self.show(controller, sender: self)
    }
    
    
}

