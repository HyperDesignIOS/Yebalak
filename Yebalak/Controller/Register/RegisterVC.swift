//
//  RegisterVC.swift
//  Yebalak
//
//  Created by AmrObjection on 4/10/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit
import SwiftSpinner
import MOLH

class RegisterVC: UIViewController,UITextFieldDelegate ,UIPopoverPresentationControllerDelegate {
    
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
       didLoad()
        phoneTF.delegate = self
    }
    
    
    @IBAction func haveAccountButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "LoginID")
        //self.present(controller, animated: true, completion: nil)
        self.show(controller, sender: self)
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        
        var isValidData = true
       // spinner = self.displaySpinner(onView: self.view)
        if MOLHLanguage.currentAppleLanguage() == "en"{
            SwiftSpinner.show(NSLocalizedString("LOADING",comment:""))
        }
        else
        {
            SwiftSpinner.show(NSLocalizedString("LOADING",comment:""))
        }

        let phone = self.phoneTF.text!
        if phone.isEmpty || phone.containsWhiteSpace() {
            //self.removeSpinner(spinner: self.spinner)
            SwiftSpinner.hide()
            
//            phoneTF.attributedPlaceholder = NSAttributedString(string: "Please enter Email ID", attributes: [NSAttributedStringKey.foregroundColor: UIColor.red])
            isValidData = false
            generalMethod.showAlert(title: "", message: NSLocalizedString("NOPHONEENTERED", comment: ""), vc: self, closure: nil)
            return
            
        }
        else if !phone.isValidPhone() {
           // self.removeSpinner(spinner: self.spinner)
            SwiftSpinner.hide()
            isValidData = false
            generalMethod.showAlert(title: "", message: NSLocalizedString("INVALIDPHONE", comment: ""), vc: self, closure: nil)
            return
        }
        
        let name = self.userNameTF.text!
        if name.isEmpty || name.containsWhiteSpace() {
           // self.removeSpinner(spinner: self.spinner)
            SwiftSpinner.hide()
            isValidData = false
            generalMethod.showAlert(title: "", message: NSLocalizedString("NONAMEENTERED", comment: ""), vc: self, closure: nil)
            return
            
        }
        let mail = self.emailTF.text!
        if mail.isEmpty || mail.containsWhiteSpace()  {
           // self.removeSpinner(spinner: self.spinner)
            SwiftSpinner.hide()
            isValidData = false
            generalMethod.showAlert(title: "", message: NSLocalizedString("NOEMAILENTERED", comment: ""), vc: self, closure: nil)
            return
        }
        else if !mail.isValidEmail() {
            //self.removeSpinner(spinner: self.spinner)
            SwiftSpinner.hide()
            isValidData = false
            generalMethod.showAlert(title: "", message: NSLocalizedString("INVAILDEMAIL", comment: ""), vc: self, closure: nil)
            return
        }
        let password = self.passwordTF.text!
        if password.isEmpty || password.containsWhiteSpace()  {
            //self.removeSpinner(spinner: self.spinner)
            SwiftSpinner.hide()
            isValidData = false
            generalMethod.showAlert(title: "", message: NSLocalizedString("NOPASSWORDENTERED", comment: ""), vc: self, closure: nil)
            return
            
        }
        else if password.count < 6 {
            SwiftSpinner.hide()
            isValidData = false
            generalMethod.showAlert(title: "", message: NSLocalizedString("SHORTPASSWORD", comment: ""), vc: self, closure: nil)
            return
        }
        
        else if !password.isValidPassword() {
            SwiftSpinner.hide()
            isValidData = false
            generalMethod.showAlert(title: "", message: "invalid password", vc: self, closure: nil)
            return
        }
        let confirmpass = self.confirmPasswordTF.text!
        if confirmpass.isEmpty || confirmpass.containsWhiteSpace() {
            //self.removeSpinner(spinner: self.spinner)
            SwiftSpinner.hide()
            isValidData = false
            generalMethod.showAlert(title: "", message: NSLocalizedString("NOCONFIRMATIONPASSWORDENTERED", comment: ""), vc: self, closure: nil)
            return
        }
        else if password != confirmpass {
            //self.removeSpinner(spinner: self.spinner)
            SwiftSpinner.hide()
            isValidData = false
            generalMethod.showAlert(title: "", message: NSLocalizedString("PASSWORDCONFIRMATIONFAILD", comment: ""), vc: self, closure: nil)
            return
        }
        if isValidData{
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
    func didLoad(){
        enterInformation.text = NSLocalizedString("Enter Information", comment: "")
        enterActivationLabel.text = NSLocalizedString("Enter Activation Key", comment:"")
        registerTitle.text = NSLocalizedString("Registration Title", comment: "")
        phoneTF.placeholder = NSLocalizedString("PHONE", comment: "")
        userNameTF.placeholder = NSLocalizedString("User Name", comment: "")
        emailTF.placeholder = NSLocalizedString("Email", comment: "")
        passwordTF.placeholder = NSLocalizedString("Password", comment: "")
        confirmPasswordTF.placeholder = NSLocalizedString("Confirm Password", comment: "")
        haveAccount.setTitle(NSLocalizedString("You Have Account", comment: ""), for: .normal)
        registerButton.setTitle(NSLocalizedString("Sign Up", comment: ""), for:.normal)
        hideKeyboardWhenTappedAround()
    }
    
}
