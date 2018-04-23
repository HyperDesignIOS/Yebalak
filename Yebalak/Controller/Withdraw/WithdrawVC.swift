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
    @IBOutlet weak var withdrawHeader: UILabel!
    @IBOutlet weak var withdrawTite: UILabel!
    
    @IBOutlet weak var sendButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = NSLocalizedString("WITHDRAW HEADER", comment: "")
        withdrawHeader.text = NSLocalizedString("WITHDRAW HEADER", comment: "")
        withdrawTite.text = NSLocalizedString("WITHDRAW TITLE", comment: "")
        phoneTF.text = NSLocalizedString("PHONE", comment: "")
         valueTF.text = NSLocalizedString("VALUE", comment: "")
        
        sendButton.setTitle(NSLocalizedString("SEND", comment: ""), for: .normal)
        
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
