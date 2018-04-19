//
//  WithdrawVC.swift
//  Yebalak
//
//  Created by AmrObjection on 4/15/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit
import SwiftSpinner
class WithdrawVC: UIViewController {
    
    var withdrawId : Int!
    let userId = UserDefaults.standard.getUserID()
    let generalMethod = GeneralMethod()
    var spinner : UIView!
    
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var valueTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func sendWithdrawButton(_ sender: Any) {
        
        //spinner = self.displaySpinner(onView: self.view)
        SwiftSpinner.show("loading...")
        apiRequests.apisInstance.WithdrawForm(userPhone: phoneTF.text!, userID:"\(userId)" , valval: valueTF.text!, paymentID:"\(withdrawId!)") { (msg, status) in
           // self.removeSpinner(spinner: self.spinner)
            SwiftSpinner.hide()
            self.generalMethod.showAlert(title: "", message: msg, vc: self, closure: nil)
        }
        
        
    }
    

  

}
