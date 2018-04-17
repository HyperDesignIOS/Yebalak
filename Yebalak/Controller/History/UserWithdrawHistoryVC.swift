//
//  UserWithdrawHistoryVC.swift
//  Yebalak
//
//  Created by AmrObjection on 4/17/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit

class UserWithdrawHistoryVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    var userWithdraws : [Userwithdraw] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userWithdraws.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }

    func getUserWithdrawHistory(){
        let id = UserDefaults.standard.getUserID()
        apiRequests.apisInstance.withdrawHistory(userID:" \(id)") { (userWithdraws) in
           self.userWithdraws = userWithdraws
            
        }
    }

}
