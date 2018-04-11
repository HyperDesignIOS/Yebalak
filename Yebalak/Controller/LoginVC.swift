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
    
}
