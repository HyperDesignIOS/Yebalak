//
//  LoginVC.swift
//  Yebalak
//
//  Created by AmrObjection on 4/10/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit
import SwiftSpinner
import MOLH

class LoginVC: UIViewController {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emailOrPHhone: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var dontHaveAccountButton
    : UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    let generalMethod = GeneralMethod()
    var msg : String!
    var done : String!
    var user : User!
    var active : String!
    var spinner : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        didLoad()
    }
    
    
    @IBAction func forgetPassword(_ sender: Any) {
    }
    
    @IBAction func dontHaveAccountButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Register", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "RegisterID")
        self.present(controller, animated: true, completion: nil)
//        self.show(controller, sender: self)
    }
    
    @IBAction func loginButton(_ sender: Any) {
        
        if MOLHLanguage.currentAppleLanguage() == "en"{
            SwiftSpinner.show(NSLocalizedString("LOADING",comment:""))
        }
        else
        {
            SwiftSpinner.show(NSLocalizedString("LOADING",comment:""))
        }
        let mail = self.emailOrPHhone.text!
        if mail.isEmpty || mail.containsWhiteSpace()  {
            // self.removeSpinner(spinner: self.spinner)
            SwiftSpinner.hide()
            generalMethod.showAlert(title: "", message: NSLocalizedString("NOEMAILENTERED", comment: ""), vc: self, closure: nil)
            return
        }
        let password = self.passwordTF.text!
        if password.isEmpty || password.containsWhiteSpace(){
           // self.removeSpinner(spinner: self.spinner)
            SwiftSpinner.hide()
            generalMethod.showAlert(title: "", message: NSLocalizedString("NOPASSWORDENTERED", comment: ""), vc: self, closure: nil)
            return
            
        }
        
        apiRequests.apisInstance.login( userMail:mail , userPassword:password) { (user,msg,done,active,date,last) in
            
            self.msg = msg
            self.done = done
            self.active = active
            self.user = user
            //  print(self.user.name)
            if self.done == "1"{
                if active == "0"{
                    UserDefaults.standard.setUserID(value: self.user.id)
                    UserDefaults.standard.setLoggedIn(value: true)
                    //self.removeSpinner(spinner: self.spinner)
                      SwiftSpinner.hide()
                    self.generalMethod.showAlert(title: "", message: msg, vc: self, closure: {
                        let storyboard = UIStoryboard(name: "Register", bundle: nil)
                        let controller = storyboard.instantiateViewController(withIdentifier: "VerifyID")
                        
                        
                        let id = UserDefaults.standard.getUserID()
                        apiRequests.apisInstance.ResendCode(userId: id) { (msg) in
                            
//                                self.generalMethod.showAlert(title: "", message:msg , vc: self, closure: nil)
                            self.show(controller, sender: self)
                            
                            
                        }
                    })
                    
                }
                else{
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let navController = storyboard.instantiateViewController(withIdentifier: "BalanceNavigationID") as! UINavigationController
                    let controller = navController.viewControllers.first as! BalanceViewController
                    controller.balance = self.user.balance
                    controller.date = date
                    controller.lastTransaction = last
                    //self.present(controller, animated: true, completion: nil)
                    //self.removeSpinner(spinner: self.spinner)
                      SwiftSpinner.hide()
//                    self.present(controller, animated: true, completion: {
//                    })
                    self.show(navController, sender: self)
                    let encodedData = NSKeyedArchiver.archivedData(withRootObject: user)
                    UserDefaults.standard.setUser(value: encodedData)
                     UserDefaults.standard.setUserID(value: self.user.id)
                
                    UserDefaults.standard.setLoggedIn(value: true)
                }
            }
            else if self.done == "0"
            {
               // self.removeSpinner(spinner: self.spinner)
                  SwiftSpinner.hide()
                self.generalMethod.showAlert(title: "", message: self.msg, vc: self, closure: nil)
            }
        }
    }
    func didLoad(){
        headerLabel.text = NSLocalizedString("Header", comment: "")
        titleLabel.text = NSLocalizedString("Login Title",comment: "")
        emailOrPHhone.placeholder = NSLocalizedString("Phone,Email", comment: "")
        passwordTF.placeholder = NSLocalizedString("Password", comment: "")
        dontHaveAccountButton.setTitle(NSLocalizedString("You Do Not Account ?", comment: ""), for: .normal)
        loginButton.setTitle(NSLocalizedString("LOGIN", comment: ""), for: .normal)
    }
        
    }
    
    

