//
//  DepositHistoryVC.swift
//  Yebalak
//
//  Created by AmrObjection on 4/16/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit

class DepositHistoryVC: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    
    var depositsArr : [Deposit] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return depositsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "String")
        
        return cell!
        

    }
    
  

  


    

   
 
    func getDepositHistory (){
        let id = UserDefaults.standard.getUserID()
        apiRequests.apisInstance.depositeHistory(userID: "\(id)") { (deposites) in
            self.depositsArr = deposites
        }
        
    }

}
