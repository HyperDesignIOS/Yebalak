//
//  ViewController.swift
//  Yebalak
//
//  Created by AmrObjection on 4/10/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit

class BalanceViewController: UIViewController {
    
    var balance : String!
    var lastTransaction :String!
    var date : String!

    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var lastTransactionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var balanceImageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        balanceLabel.text = balance
        lastTransactionLabel.text = lastTransaction
        dateLabel.text = date
        balanceImageLabel.text = balance
        
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
    
}

