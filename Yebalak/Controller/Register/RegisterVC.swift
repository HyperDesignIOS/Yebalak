//
//  RegisterVC.swift
//  Yebalak
//
//  Created by AmrObjection on 4/10/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {
    
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    var generalMethod = GeneralMethod()
    var msg : String!
    var done : String!
    var user : User!
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
    
    
    @IBAction func haveAccountButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "LoginID")
        //self.present(controller, animated: true, completion: nil)
        self.show(controller, sender: self)
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        
        
        
        let phone = self.phoneTF.text!
        if phone.isEmpty || phone.containsWhiteSpace() {
            generalMethod.showAlert(title: "", message: "please enter your phone ", vc: self, closure: nil)
            return
            
        }
        else if !phone.isValidPhone() {
            generalMethod.showAlert(title: "", message: "invalid phone", vc: self, closure: nil)
            return
        }
        
        let name = self.userNameTF.text!
        if name.isEmpty || name.containsWhiteSpace() {
            generalMethod.showAlert(title: "", message: "please enter your name ", vc: self, closure: nil)
            return
            
        }
        let mail = self.emailTF.text!
        if mail.isEmpty || mail.containsWhiteSpace()  {
            generalMethod.showAlert(title: "", message: "please enter your e-mail", vc: self, closure: nil)
            return
        }
        else if !mail.isValidEmail() {
            generalMethod.showAlert(title: "", message: "invalid e-mail", vc: self, closure: nil)
            return
        }
        let password = self.passwordTF.text!
        if password.isEmpty || password.containsWhiteSpace()  {
            generalMethod.showAlert(title: "", message: "please enter your password", vc: self, closure: nil)
            return
            
        }
        //        else if !password.isValidPassword() {
        //            generalMethod.showAlert(title: "", message: "invalid password", vc: self, closure: nil)
        //            return
        //        }
        let confirmpass = self.confirmPasswordTF.text!
        if confirmpass.isEmpty || confirmpass.containsWhiteSpace() {
            generalMethod.showAlert(title: "", message: "please enter your password confirmation", vc: self, closure: nil)
            return
        }
        else if password != confirmpass {
            generalMethod.showAlert(title: "", message: " password confirmation failed", vc: self, closure: nil)
            return
        }
        
            apiRequests.apisInstance.register(userName:name, userPassword:password,userPhone: phone, userMail:mail ) { (user,msg,done) in
            
            self.done = done
            if self.done == "1"{
                self.user = user
                self.msg = msg
                print(self.user.name)
                UserDefaults.standard.setUserID(value: self.user.id)
                UserDefaults.standard.setUserName(value: self.user.name)
                UserDefaults.standard.setUserPhone(value: self.user.phone)
                UserDefaults.standard.setUserEmail(value: self.user.email)
                UserDefaults.standard.setUserAddress(value: self.user.address)
                UserDefaults.standard.setLoggedIn(value: true)
               let storyboard = UIStoryboard(name: "Register", bundle: nil)
               let controller = storyboard.instantiateViewController(withIdentifier: "VerifyID")
                //self.present(controller, animated: true, completion: nil)
                self.show(controller, sender: self)
            }
            else if self.done == "0"
            {
                self.msg = msg
                self.generalMethod.showAlert(title: "", message:self.msg, vc: self, closure: nil)
            }
        }
        
    }
    
}
