//
//  WithdrawVC.swift
//  Yebalak
//
//  Created by AmrObjection on 4/15/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit
import SwiftSpinner
import MOLH

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
        viewDidLoad()
    }
    
    
    @IBAction func sendWithdrawButton(_ sender: Any) {
        
        //spinner = self.displaySpinner(onView: self.view)
     
        let phone = phoneTF.text!
        if phone.isEmpty || phone.containsWhiteSpace() {
            
            generalMethod.showAlert(title: "", message: NSLocalizedString("NOPHONEENTERED", comment: ""), vc: self, closure: nil)
            return
        }
        let value = valueTF.text!
        if value.isEmpty || value.containsWhiteSpace() {
            generalMethod.showAlert(title: "", message: NSLocalizedString("NOVALUEENTERED", comment: ""), vc: self, closure: nil)
            return
        }
        if MOLHLanguage.currentAppleLanguage() == "en"{
            SwiftSpinner.show(NSLocalizedString("LOADING",comment:""))
        }
        else
        {
            SwiftSpinner.show(NSLocalizedString("LOADING",comment:""))
        }
        apiRequests.apisInstance.WithdrawForm(userPhone: phoneTF.text!, userID:"\(userId)" , valval: valueTF.text!, paymentID:"\(withdrawId!)") { (msg, status) in
           // self.removeSpinner(spinner: self.spinner)
            SwiftSpinner.hide()
            self.generalMethod.showAlert(title: "", message: msg, vc: self, closure: nil)
        }
        func didLoad(){
            self.navigationItem.title = NSLocalizedString("WITHDRAW HEADER", comment: "")
            withdrawHeader.text = NSLocalizedString("WITHDRAW HEADER", comment: "")
            withdrawTite.text = NSLocalizedString("WITHDRAW TITLE", comment: "")
            phoneTF.placeholder = NSLocalizedString("PHONE", comment: "")
            valueTF.placeholder = NSLocalizedString("VALUE", comment: "")
            
            sendButton.setTitle(NSLocalizedString("SEND", comment: ""), for: .normal)
        }
        
    }
    

  

}
