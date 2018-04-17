//
//  EditProfileVC.swift
//  Yebalak
//
//  Created by AmrObjection on 4/17/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit

class EditProfileVC: UIViewController {
    
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var phoneTF: UITextField!
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var addressTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    var user: User!
    var msg: String!
    let generalMethod = GeneralMethod()
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTF.text = UserDefaults.standard.getUserName()
        phoneTF.text = UserDefaults.standard.getUserPhone()
        emailTF.text = UserDefaults.standard.getUserEmail()
        addressTF.text = UserDefaults.standard.getUserAddress()
  
    }
    
    @IBAction func editProfileButton(_ sender: Any) {
       // let id = UserDefaults.standard.getUserID()
        apiRequests.apisInstance.editProfile(userId: "2", userMail: emailTF.text!, userPhone:  phoneTF.text!, userName: nameTF.text!, userAddress:addressTF.text!, userPassword: passwordTF.text!) { (user, msg) in
           self.msg = msg
            self.user = user
              self.generalMethod.showAlert(title: "", message: msg, vc: self, closure: nil)
        }
        
    }
    
}
