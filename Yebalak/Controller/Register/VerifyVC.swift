//
//  VerifyVC.swift
//  Yebalak
//
//  Created by AmrObjection on 4/11/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit
import SwiftSpinner

class VerifyVC: UIViewController {
 
    let generalMethod = GeneralMethod()
    var msg : String!
    var done : String!
    var user : User!
    var balance : String!
    var date : String!
    var last : String!
    var spinner : UIView!
    
    @IBOutlet weak var enterInformation: UILabel!
    @IBOutlet weak var enterActivation: UILabel!
    @IBOutlet weak var activationTitle: UILabel!
    @IBOutlet weak var codeTF: UITextField!
    
    @IBOutlet weak var verifyButton: UIButton!
    @IBOutlet weak var sendCodeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enterInformation.text = NSLocalizedString("Enter Information", comment: "")
        enterActivation.text = NSLocalizedString("Enter Activation Key", comment: "")
        activationTitle.text = NSLocalizedString("Activation Title", comment: "")
        codeTF.placeholder = NSLocalizedString("Activation Code", comment: "")
        verifyButton.setTitle(NSLocalizedString("VERIFY", comment: ""), for: .normal)
        sendCodeButton.setTitle(NSLocalizedString("SendCodeAgain", comment: ""), for: .normal)
        
        hideKeyboardWhenTappedAround()

    }
    
   
    @IBAction func ResendCode(_ sender: Any) {
       // spinner = self.displaySpinner(onView: self.view)
          SwiftSpinner.show("loading...")

        let id = UserDefaults.standard.getUserID()
        apiRequests.apisInstance.ResendCode(userId: id) { (msg) in
            if msg != ""
            {
                self.removeSpinner(spinner: self.spinner)
                self.generalMethod.showAlert(title: "", message:msg , vc: self, closure: nil)
            }
        }
    }
    
    
    @IBAction func verifyButton(_ sender: Any) {
      
        spinner = self.displaySpinner(onView: self.view)
        let code = self.codeTF.text!
        if code.isEmpty || code.containsWhiteSpace(){
            self.removeSpinner(spinner: self.spinner)
            generalMethod.showAlert(title: "", message: "please enter verification code ", vc: self, closure: nil)
            return
        }
        let id = UserDefaults.standard.getUserID()
        apiRequests.apisInstance.verify(userId: id, userCode: code) { (user, msg, done, balance, date, last) in
            self.done = done
            if self.done == "1"{
                self.user = user
                self.msg = msg
                self.balance = balance
                self.date = date
                self.last = last
                print(self.user.name)
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "BalanceID") as! BalanceViewController
                controller.balance = self.balance
                controller.date = self.date
                controller.lastTransaction = self.last
                self.removeSpinner(spinner: self.spinner)
                self.show(controller, sender: self)
            }
            else if self.done == "0"
            {
                self.msg = msg
                self.removeSpinner(spinner: self.spinner)
                self.generalMethod.showAlert(title: "", message:self.msg, vc: self, closure: nil)
            }
           
        }
    }
}
    

