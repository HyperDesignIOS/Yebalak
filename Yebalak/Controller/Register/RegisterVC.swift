//
//  RegisterVC.swift
//  Yebalak
//
//  Created by AmrObjection on 4/10/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit
import SwiftSpinner
class RegisterVC: UIViewController {
    
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    @IBOutlet weak var enterInformation: UILabel!
    @IBOutlet weak var enterActivationLabel: UILabel!
    @IBOutlet weak var haveAccount: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var registerTitle: UILabel!
    var generalMethod = GeneralMethod()
    var msg : String!
    var done : String!
    var user : User!
    var spinner : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enterInformation.text = NSLocalizedString("Enter Information", comment: "")
        enterActivationLabel.text = NSLocalizedString("Enter Activation Key", comment:"")
        registerTitle.text = NSLocalizedString("Registration Title", comment: "")
        phoneTF.placeholder = NSLocalizedString("Phone Number", comment: "")
        userNameTF.placeholder = NSLocalizedString("User Name", comment: "")
        emailTF.placeholder = NSLocalizedString("Email", comment: "")
        passwordTF.placeholder = NSLocalizedString("Password", comment: "")
        confirmPasswordTF.placeholder = NSLocalizedString("Confirm Password", comment: "")
        haveAccount.setTitle(NSLocalizedString("You Have Account", comment: ""), for: .normal)
        registerButton.setTitle(NSLocalizedString("Sign Up", comment: ""), for:.normal)
        hideKeyboardWhenTappedAround()
    }
    
    
    @IBAction func haveAccountButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "LoginID")
        //self.present(controller, animated: true, completion: nil)
        self.show(controller, sender: self)
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        
        
       // spinner = self.displaySpinner(onView: self.view)
          SwiftSpinner.show("loading...")

        let phone = self.phoneTF.text!
        if phone.isEmpty || phone.containsWhiteSpace() {
            //self.removeSpinner(spinner: self.spinner)
            SwiftSpinner.hide()
            generalMethod.showAlert(title: "", message: "please enter your phone ", vc: self, closure: nil)
            return
            
        }
        else if !phone.isValidPhone() {
           // self.removeSpinner(spinner: self.spinner)
            SwiftSpinner.hide()
            generalMethod.showAlert(title: "", message: "invalid phone", vc: self, closure: nil)
            return
        }
        
        let name = self.userNameTF.text!
        if name.isEmpty || name.containsWhiteSpace() {
           // self.removeSpinner(spinner: self.spinner)
            SwiftSpinner.hide()
            generalMethod.showAlert(title: "", message: "please enter your name ", vc: self, closure: nil)
            return
            
        }
        let mail = self.emailTF.text!
        if mail.isEmpty || mail.containsWhiteSpace()  {
           // self.removeSpinner(spinner: self.spinner)
            SwiftSpinner.hide()
            generalMethod.showAlert(title: "", message: "please enter your e-mail", vc: self, closure: nil)
            return
        }
        else if !mail.isValidEmail() {
            //self.removeSpinner(spinner: self.spinner)
            SwiftSpinner.hide()
            generalMethod.showAlert(title: "", message: "invalid e-mail", vc: self, closure: nil)
            return
        }
        let password = self.passwordTF.text!
        if password.isEmpty || password.containsWhiteSpace()  {
            //self.removeSpinner(spinner: self.spinner)
            SwiftSpinner.hide()
            generalMethod.showAlert(title: "", message: "please enter your password", vc: self, closure: nil)
            return
            
        }
        //        else if !password.isValidPassword() {
        //            generalMethod.showAlert(title: "", message: "invalid password", vc: self, closure: nil)
        //            return
        //        }
        let confirmpass = self.confirmPasswordTF.text!
        if confirmpass.isEmpty || confirmpass.containsWhiteSpace() {
            //self.removeSpinner(spinner: self.spinner)
            SwiftSpinner.hide()
            generalMethod.showAlert(title: "", message: "please enter your password confirmation", vc: self, closure: nil)
            return
        }
        else if password != confirmpass {
            //self.removeSpinner(spinner: self.spinner)
            SwiftSpinner.hide()
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
                let encodedData = NSKeyedArchiver.archivedData(withRootObject: user)
                UserDefaults.standard.setUser(value: encodedData)
                UserDefaults.standard.setLoggedIn(value: true)
               let storyboard = UIStoryboard(name: "Register", bundle: nil)
               let controller = storyboard.instantiateViewController(withIdentifier: "VerifyID")
                //self.present(controller, animated: true, completion: nil)
              //  self.removeSpinner(spinner: self.spinner)
                SwiftSpinner.hide()
                self.show(controller, sender: self)
            }
            else if self.done == "0"
            {
                self.msg = msg
                //self.removeSpinner(spinner: self.spinner)
                SwiftSpinner.hide()
                self.generalMethod.showAlert(title: "", message:self.msg, vc: self, closure: nil)
            }
        }
        
    }
    
}
