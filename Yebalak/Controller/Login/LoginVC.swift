//
//  LoginVC.swift
//  Yebalak
//
//  Created by AmrObjection on 4/10/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit
import SwiftSpinner

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailOrPHhone: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    let generalMethod = GeneralMethod()
    var msg : String!
    var done : String!
    var user : User!
    var active : String!
    var spinner : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.isLoggedIn(){
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "BalanceID")
//            self.navigationController!.pushViewController(controller, animated: true)
//            self.present(controller, animated: true, completion: nil)
            self.show(controller, sender: self)
        }
        else{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "LoginID")
            //self.present(controller, animated: true, completion: nil)
            self.show(controller, sender: self)
        }
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        if UserDefaults.standard.isLoggedIn(){
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let controller = storyboard.instantiateViewController(withIdentifier: "BalanceID")
//            self.present(controller, animated: true, completion: nil)
//            //            self.show(controller, sender: self)
//        }
//        else{
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let controller = storyboard.instantiateViewController(withIdentifier: "LoginID")
//            //self.present(controller, animated: true, completion: nil)
//            self.show(controller, sender: self)
//        }
//    }
    
    @IBAction func forgetPassword(_ sender: Any) {
    }
    
    @IBAction func dontHaveAccountButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Register", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "RegisterID")
        self.present(controller, animated: true, completion: nil)
//        self.show(controller, sender: self)
    }
    
    @IBAction func loginButton(_ sender: Any) {
        let mail = self.emailOrPHhone.text!
//        if mail.isEmpty || mail.containsWhiteSpace(){
//            generalMethod.showAlert(title: "", message: "please enter your mail", vc: self, closure: nil)
//            return
//        }
      //  spinner = self.displaySpinner(onView: self.view)
          SwiftSpinner.show("loading...")

        let password = self.passwordTF.text!
        if password.isEmpty || password.containsWhiteSpace(){
           // self.removeSpinner(spinner: self.spinner)
            SwiftSpinner.hide()
            generalMethod.showAlert(title: "", message: "please enter your password", vc: self, closure: nil)
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
                    let controller = storyboard.instantiateViewController(withIdentifier: "BalanceID") as! BalanceViewController
                    controller.balance = self.user.balance
                    controller.date = date
                    controller.lastTransaction = last
                    //self.present(controller, animated: true, completion: nil)
                    //self.removeSpinner(spinner: self.spinner)
                      SwiftSpinner.hide()
                    self.show(controller, sender: self)
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
        
        
    }
    
    

