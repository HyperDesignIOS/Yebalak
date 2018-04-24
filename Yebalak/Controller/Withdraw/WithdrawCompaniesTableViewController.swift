//
//  WithdrawCompaniesTableViewController.swift
//  Yebalak
//
//  Created by Hyper Design on 4/15/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//SwiftSpinner.show("Connecting to satellite...")

import UIKit
import AlamofireImage
import SwiftSpinner
import MOLH


class WithdrawCompaniesTableViewController: UIViewController , UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var withdrawCompanies : [WithdrawCompany] = []
    var spinner : UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        didLoad()
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return withdrawCompanies.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WithdrawCompanyCell", for: indexPath) as! WithdrawCompaniesTableViewCell

        cell.withdrawCompanyLogo.layer.cornerRadius = (cell.withdrawCompanyLogo.frame.size.width) / 2
        cell.withdrawCompanyLogo.af_setImage(withURL: URL(string: "\(WithdrawImagesURL)\(withdrawCompanies[indexPath.row].logo!)")!)

        // Configure the cell...

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let id = withdrawCompanies[indexPath.row].id
        let storyboard = UIStoryboard(name: "Withdraw", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "withdrawID") as! WithdrawVC
        controller.withdrawId = id
        self.show(controller, sender: self)
    }
    

    
    func getWithdrawCompaniesLogo(){
        // call api
        let id = UserDefaults.standard.getUserID()
        apiRequests.apisInstance.WithdrawImage(userID: "\(id)") { (withdrawCompanies) in
            self.withdrawCompanies = withdrawCompanies
            self.tableView.reloadData()
            //self.removeSpinner(spinner: self.spinner)
            SwiftSpinner.hide()
        }
    }
    func didLoad(){
        //spinner = self.displaySpinner(onView: self.view)
        self.navigationItem.title = NSLocalizedString("WITHDRAWCOMPANIES", comment: "")
        
        tableView.delegate = self
        tableView.dataSource = self
        if MOLHLanguage.currentAppleLanguage() == "en"{
            SwiftSpinner.show(NSLocalizedString("LOADING",comment:""))
        }
        else
        {
            SwiftSpinner.show(NSLocalizedString("LOADING",comment:""))
        }
        getWithdrawCompaniesLogo()
        tableView.reloadData()
    }

}
