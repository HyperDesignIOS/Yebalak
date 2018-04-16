//
//  WithdrawVC.swift
//  Yebalak
//
//  Created by AmrObjection on 4/15/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit

class WithdrawVC: UIViewController {
    
    var withdrawId : Int!
    let userId = UserDefaults.standard.getUserID()
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var valueTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func sendWithdrawButton(_ sender: Any) {
        apiRequests.apisInstance.WithdrawForm(userPhone: phoneTF.text!, userID:"\(userId)" , valval: valueTF.text!, paymentID:"\(withdrawId)") { (msg, status) in
            print (msg)
            print (status)
        }
        
        
    }
    

  

}
