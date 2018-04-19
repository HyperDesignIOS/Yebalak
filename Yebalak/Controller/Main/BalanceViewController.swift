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
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        
//        if UserDefaults.standard.isLoggedIn()
//        {
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let controller = storyboard.instantiateViewController(withIdentifier: "BalanceID")
//            balanceLabel.text = balance
//            lastTransactionLabel.text = lastTransaction
//            dateLabel.text = date
//            self.show(controller, sender: self)
//        }
//        else {
//            let storyboard = UIStoryboard(name: "Login", bundle: nil)
//            let controller = storyboard.instantiateViewController(withIdentifier: "LoginID")
//            self.show(controller, sender: self)
//        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func withdrawButton(_ sender: Any)
    {
        let storyboard = UIStoryboard(name: "Withdraw", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "WithdrawImagesID")
//        self.navigationController!.pushViewController(controller, animated: true)
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

