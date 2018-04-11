//
//  GeneralMethod.swift
//  Yebalak
//
//  Created by AmrObjection on 4/11/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import Foundation
import UIKit

class GeneralMethod{
    
    
    func showAlert(title:String, message:String, vc:UIViewController, closure:(()->())?)
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default)
        { (result : UIAlertAction) -> Void in
            closure?()
        }
        alertController.addAction(okAction)
        vc.present(alertController, animated: true, completion: nil)
    }
}
