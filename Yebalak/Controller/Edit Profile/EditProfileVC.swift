//
//  EditProfileVC.swift
//  Yebalak
//
//  Created by AmrObjection on 4/17/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import UIKit
import SwiftSpinner
import MOLH

class EditProfileVC: UIViewController {
    
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var phoneTF: UITextField!
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var addressTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var firstImage: UIImageView!
    
    @IBOutlet weak var secondImage: UIImageView!
    
    @IBOutlet weak var editTitle: UILabel!

    @IBOutlet weak var englishLabel: UILabel!
    @IBOutlet weak var arabicLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    
    var user: User!
    var msg: String!
    let generalMethod = GeneralMethod()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = NSLocalizedString("SETTINGS", comment: "")
        editTitle.text = NSLocalizedString("EDIT TITLE", comment: "")
        //selectLanguageLbl.text = NSLocalizedString("SELECT LANGUAGE", comment: "")
        
        nameTF.placeholder = NSLocalizedString("USER NAME", comment: "")
        emailTF.placeholder = NSLocalizedString("EMAIL", comment: "")
        phoneTF.placeholder = NSLocalizedString("PHONE", comment: "")
        addressTF.placeholder = NSLocalizedString("ADDRESS", comment: "")
        passwordTF.placeholder = NSLocalizedString("PASSWORD", comment: "")
        editButton.setTitle(NSLocalizedString("EDIT", comment: ""), for:.normal)
        arabicLabel.text = NSLocalizedString("ARABIC", comment: "")
        englishLabel.text = NSLocalizedString("ENGLISH", comment: "")
        
        if MOLHLanguage.currentAppleLanguage() == "ar"{
            imageSwap(forfirstimage: firstImage, andSecondImage: secondImage)
        }
        else{
            imageSwap(forfirstimage: secondImage, andSecondImage: firstImage)
        }
        
        
        SwiftSpinner.show("loading...")
        self.user = NSKeyedUnarchiver.unarchiveObject(with: UserDefaults.standard.getUser() as! Data) as? User
        nameTF.text = user.name
        phoneTF.text = user.phone
        emailTF.text = user.email
        addressTF.text = user.address
        SwiftSpinner.hide()
        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func editProfileButton(_ sender: Any) {
        
        let phone = self.phoneTF.text!
        if phone.isEmpty || phone.containsWhiteSpace() {
            generalMethod.showAlert(title: "", message: "please enter your phone ", vc: self, closure: nil)
            return
            
        }
        else if !phone.isValidPhone() {
            generalMethod.showAlert(title: "", message: "invalid phone", vc: self, closure: nil)
            return
        }
        
        let name = self.nameTF.text!
        if name.isEmpty || name.containsWhiteSpace() {
            generalMethod.showAlert(title: "", message: "please enter your new user name ", vc: self, closure: nil)
            return
            
        }
        let mail = self.emailTF.text!
        if mail.isEmpty || mail.containsWhiteSpace()  {
            generalMethod.showAlert(title: "", message: "please enter your new e-mail", vc: self, closure: nil)
            return
        }
        else if !mail.isValidEmail() {
            generalMethod.showAlert(title: "", message: "invalid e-mail", vc: self, closure: nil)
            return
        }
        let address = self.addressTF.text!
        if mail.isEmpty || mail.containsWhiteSpace()  {
            generalMethod.showAlert(title: "", message: "please enter your new address", vc: self, closure: nil)
            return
        }
      
        
        let id = UserDefaults.standard.getUserID()
        apiRequests.apisInstance.editProfile(userId: "\(id)", userMail: emailTF.text!, userPhone:  phoneTF.text!, userName: nameTF.text!, userAddress:addressTF.text!, userPassword: passwordTF.text!) { (user, msg) in
           self.msg = msg
            self.user = user
              self.generalMethod.showAlert(title: "", message: self.msg, vc: self, closure: nil)
        }
        
    }
    
    @IBAction func changeImage(_ sender: UIButton) {
        
        switch sender.tag{
        case 1:
            imageSwap(forfirstimage: firstImage, andSecondImage: secondImage)
//            statusOfVehicle = "new"
            if MOLHLanguage.currentAppleLanguage() != "ar"{
                MOLH.setLanguageTo("ar")
                MOLH.reset()
                
            }
            
        case 2:
            imageSwap(forfirstimage: secondImage, andSecondImage: firstImage)
//            statusOfVehicle = "used"
            if MOLHLanguage.currentAppleLanguage() !=  "en"{
                MOLH.setLanguageTo("en")
                MOLH.reset()
                
            }
            
        default:
            break
        }
    }
    
    func imageSwap(forfirstimage firstImageView: UIImageView,andSecondImage secondImageView: UIImageView)
    {
        firstImageView.image = UIImage(named: "radio-on-button-2")
        secondImageView.image = UIImage(named: "circle")
        
    }
    
}
