//
//  ViewController.swift
//  Yebalak
//
//  Created by AmrObjection on 4/10/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func openRgister(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Register", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "BalanceID")
        //self.present(controller, animated: true, completion: nil)
        self.show(controller, sender: self)
        
    }
    
}

