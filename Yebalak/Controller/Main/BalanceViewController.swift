//
//  ViewController.swift
//  Yebalak
//
//  Created by AmrObjection on 4/10/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit
import SwiftSpinner
import MOLH

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
      didLoad()
    }
    
    @IBAction func withdrawButton(_ sender: Any)
    {
        let storyboard = UIStoryboard(name: "Withdraw", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "WithdrawImagesID")
       // self.navigationController?.pushViewController(controller, animated: true)
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
    
    @IBAction func refrehButton(_ sender: Any) {
        if MOLHLanguage.currentAppleLanguage() == "en"{
            SwiftSpinner.show(NSLocalizedString("LOADING",comment:""))
        }
        else
        {
            SwiftSpinner.show(NSLocalizedString("LOADING",comment:""))
        }
        getBalance()
       
    }
    
    lazy var refreshControl: UIRefreshControl = {
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(self.handleRefresh(_:)),
                                 for: UIControlEvents.valueChanged)
        refreshControl.tintColor = UIColor.green
        
        return refreshControl
    }()
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
         self.view.addSubview(self.refreshControl)
        getBalance()
        
        refreshControl.endRefreshing()
    }
    
   func  getBalance(){
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
    }
    func didLoad(){
        balanceLbl.text = NSLocalizedString("BALANCE", comment: "")
        last.text = NSLocalizedString("LAST TRANSACTION", comment: "")
        dateLbl.text = NSLocalizedString("DATE", comment: "")
        coinLbl.text = NSLocalizedString("COIN", comment: "")
        historyLbl.text = NSLocalizedString("HISTORY", comment: "")
        withdrawLbl.text = NSLocalizedString("WITHDRAW", comment: "")
        settingLbl.text = NSLocalizedString("SETTING", comment: "")
        self.navigationItem.title = NSLocalizedString("BALANCENAV", comment: "")
        
        if MOLHLanguage.currentAppleLanguage() == "en"{
            SwiftSpinner.show(NSLocalizedString("LOADING",comment:""))
        }
        else
        {
            SwiftSpinner.show(NSLocalizedString("LOADING",comment:""))
        }
        // spinner = self.displaySpinner(onView: self.view)
        getBalance()
    }
    
}

