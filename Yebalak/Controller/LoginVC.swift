//
//  LoginVC.swift
//  Yebalak
//
//  Created by AmrObjection on 4/10/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailOrPHhone: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    let generalMethod = GeneralMethod()
    var msg : String!
    var done : String!
    var user : User!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func forgetPassword(_ sender: Any) {
    }
    
    @IBAction func dontHaveAccountButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Register", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "RegisterID")
        //self.present(controller, animated: true, completion: nil)
        self.show(controller, sender: self)
    }
    
    @IBAction func loginButton(_ sender: Any) {
        let mail = self.emailOrPHhone.text!
        if mail.isEmpty || mail.containsWhiteSpace(){
            generalMethod.showAlert(title: "", message: "please enter your mail", vc: self, closure: nil)
            return
        }
        
        let password = self.passwordTF.text!
        if password.isEmpty || password.containsWhiteSpace(){
            generalMethod.showAlert(title: "", message: "please enter your password", vc: self, closure: nil)
            return
            
        }
        
        apiRequests.apisInstance.login( userMail:mail , userPassword:password) { (user,msg,done) in
            
            self.msg = msg
            self.done = done
            //  print(self.user.name)
            if self.done == "1"{
//                let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                let controller = storyboard.instantiateViewController(withIdentifier: "homeVC")
//                //self.present(controller, animated: true, completion: nil)
//                self.show(controller, sender: self)
                self.user = user
                UserDefaults.standard.setUserID(value: self.user.id)
                UserDefaults.standard.setLoggedIn(value: true)
            }
            else if self.done == "0"
            {
                self.generalMethod.showAlert(title: "", message: self.msg, vc: self, closure: nil)
            }
        }
    }
        
        
    }
    
    

