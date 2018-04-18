//
//  ApiRequests.swift
//  Yebalak
//
//  Created by AmrObjection on 4/10/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import Foundation
import SwiftyJSON

class apiRequests {
    
    static let apisInstance = apiRequests()
    let sm = serverManager()
    var msg : String!
    var done : String!
    var user : User!
    var balance : String!
    var date : String!
    var last : String!
    var active : String!
    var status : Int!
    var withdrawArray : [WithdrawCompany] = []
    var depositArray : [Deposit] = []
    var withdrawUserArray : [Userwithdraw] = []
    
    
    func  register(userName:String,userPassword:String,userPhone:String,userMail:String,didDataReady : @escaping(User,String,String)->())->(){
        
        sm.connectForApiWith(url: RegisterURL , mType: HTTPServerMethod.post, params: ["username":userName,"password":userPassword,"phone":userPhone,"email":userMail], complation: { (json) in
            
            if let obj = json {
                print (obj)
                
                var dictionaryOfJson = JSON(json!).dictionaryObject
                let done = dictionaryOfJson!["done"] as! String
                if done == "1"{
                    print(dictionaryOfJson )
                    let items = dictionaryOfJson!["user"] as! [String : Any]
                    let item = User.init(fromDictionary: items)
                    self.user = item
                    let msg = dictionaryOfJson!["msg"] as! String
                    self.msg = msg
                    self.done = done
                    
                }
                else                 {
                    let msg = dictionaryOfJson!["msg"] as! String
                    self.msg = msg
                    print("login failed check ")
                    self.user = User()
                    self.done = done
                  
                }
            }
            didDataReady(self.user,self.msg,self.done)
        }, errorHandler: { (error, msg) in
            print("\(String(describing: msg))")
            didDataReady(self.user,self.msg,self.done)
        })
    }
    
    func login(userMail:String,userPassword:String,didDataReady : @escaping(User,String,String,String,String,String)->())->(){
        
        sm.connectForApiWith(url: LoginURL  , mType: HTTPServerMethod.post, params: ["email":userMail,"password":userPassword], complation: { (json) in
            
            if let obj = json {
                print (obj)
                
                var dictionaryOfJson = JSON(json!).dictionaryObject
                
                let done = dictionaryOfJson!["done"] as! String
               
                let msg = dictionaryOfJson!["msg"] as! String
              
                
                if done == "1"{
                    let active = dictionaryOfJson!["active"] as! String
                    self.active = active
                    print(dictionaryOfJson)
                    if active == "1"{
                        let items = dictionaryOfJson!["user"] as! [String : Any]
                        let item = User.init(fromDictionary: items)
                        self.user = item
                        let date = dictionaryOfJson!["date"] as! String
                        self.date = date
                        let lastTransaction = dictionaryOfJson!["last"] as! String
                        self.last = lastTransaction
                        self.msg = msg
                        self.done = done
                    }
                    else{
                        let items = dictionaryOfJson!["user"] as! [String : Any]
                        let item = User.init(fromDictionary: items)
                        self.user = item
                        self.msg = msg
                        self.done = done
                        self.date = ""
                        self.last = ""
                        self.balance = ""
                    }
                    
                }
                else
                    
                {
                    self.done = done
                    self.msg = msg
                    self.active = "0"
                    self.date = ""
                    self.last = ""
                    self.balance = ""
                    self.user = User()
                }
                
            }
            didDataReady(self.user,self.msg,self.done,self.active,self.date ,self.last )
        }, errorHandler: { (error, msg) in
            print("\(String(describing: msg))")
            didDataReady(User(),"","","","","")
        })
    }
    
    func  verify(userId:Int,userCode:String,didDataReady : @escaping(User,String,String,String,String,String)->())->(){
        
        sm.connectForApiWith(url: VerifyURL , mType: HTTPServerMethod.post, params: ["id":userId,"code":userCode], complation: { (json) in
            
            if let obj = json {
                print (obj)
                
                var dictionaryOfJson = JSON(json!).dictionaryObject
                let done = dictionaryOfJson!["done"] as! String
                if done == "1"{
                    print(dictionaryOfJson)
                    let items = dictionaryOfJson!["user"] as! [String : Any]
                    let item = User.init(fromDictionary: items)
                    self.user = item
                    let msg = dictionaryOfJson!["msg"] as! String
                    self.msg = msg
                    self.done = done
                    let balance = dictionaryOfJson!["balance"] as! String
                    self.balance = balance
                    let date = dictionaryOfJson!["date"] as! String
                    self.date = date
                    let last = dictionaryOfJson!["last"] as! String
                    self.last = last
                }
                else                 {
                    let msg = dictionaryOfJson!["msg"] as! String
                    self.msg = msg
                    print("login failed check ")
                    self.user = User()
                    self.done = done
                    self.balance = ""
                    self.date = ""
                    self.last = ""
                }
            }
            didDataReady(self.user,self.msg,self.done,self.balance,self.date,self.last)
        }, errorHandler: { (error, msg) in
            print("\(String(describing: msg))")
            didDataReady(self.user,self.msg,self.done,self.balance,self.date,self.last)
        })
    }
    
    
    func  ResendCode(userId:Int,didDataReady : @escaping(String)->())->(){
        
        sm.connectForApiWith(url: ResendCodeURL , mType: HTTPServerMethod.post, params: ["id":userId], complation: { (json) in
            
           didDataReady("")
           
        }, errorHandler: { (error, msg) in
            self.msg = msg as! String
            print("\(String(describing: msg))")
            didDataReady(self.msg)
        })
    }
    
    func WithdrawForm(userPhone:String,userID:String,valval:String,paymentID:String,didDataReady : @escaping(String,Int)->())->(){
        
        sm.connectForApiWith(url: WithdrawFormURL  , mType: HTTPServerMethod.post, params: ["phone":userPhone,"id":userID,"valval":valval,"payment":paymentID], complation: { (json) in
            
            if let obj = json {
                print (obj)
                
                var dictionaryOfJson = JSON(json!).dictionaryObject
                
                let msg = dictionaryOfJson!["msg"] as! String
                 self.msg = msg
                
                let status = dictionaryOfJson!["status"] as! Int
                self.status = status
            
                
            }
            didDataReady(self.msg,self.status)
        }, errorHandler: { (error, msg) in
            print("\(String(describing: error))")
            didDataReady("",0)
        })
    }
    
    func WithdrawImage(userID:String,didDataReady : @escaping([WithdrawCompany])->())->(){
        
        sm.connectForApiWith(url: WithdrawCompaniesURL  , mType: HTTPServerMethod.post, params: ["id":userID], complation: { (json) in
            
            if let obj = json {
                print (obj)
                
                var dictionaryOfJson = JSON(json!).dictionaryObject
                
                let items = dictionaryOfJson!["withdrawco"] as! [[String : Any]]
                for item in items {
                    let item = WithdrawCompany.init(fromJson: item)
                    self.withdrawArray.append(item)
                    print (item.nameEn)
                    
                }
                
            }
            didDataReady(self.withdrawArray)
        }, errorHandler: { (error, msg) in
            print("\(String(describing: msg))")
            didDataReady([])
        })
    }
    
    func depositeHistory(userID:String,didDataReady : @escaping([Deposit])->())->(){
        
        sm.connectForApiWith(url: DepositeHistoryURL  , mType: HTTPServerMethod.post, params: ["id":userID], complation: { (json) in
            
            self.depositArray.removeAll()
            if let obj = json {
                print (obj)
                var dictionaryOfJson = JSON(json!).dictionaryObject
                let items = dictionaryOfJson!["deposits"] as! [[String : Any]]
                for item in items {
                    let item = Deposit.init(fromDictionary: item)
                    self.depositArray.append(item)
                }
                
            }
            didDataReady(self.depositArray)
        }, errorHandler: { (error, msg) in
            print("\(String(describing: msg))")
            didDataReady([])
        })
    }
    func withdrawHistory(userID:String,didDataReady : @escaping([Userwithdraw])->())->(){
        
        sm.connectForApiWith(url: UserWithdrawHistoryURL  , mType: HTTPServerMethod.post, params: ["id":userID], complation: { (json) in
            
            self.withdrawArray.removeAll()
            
            if let obj = json {
                print (obj)
                var dictionaryOfJson = JSON(json!).dictionaryObject
                let items = dictionaryOfJson!["userwithdraw"] as! [[String : Any]]
                for item in items {
                    let item = Userwithdraw.init(fromDictionary: item)
                    self.withdrawUserArray.append(item)
                }
                
            }
            didDataReady(self.withdrawUserArray)
        }, errorHandler: { (error, msg) in
            print("\(String(describing: msg))")
            didDataReady([])
        })
    }
    func  editProfile(userId:String,userMail:String,userPhone:String,userName:String,userAddress:String,userPassword:String,didDataReady : @escaping(User,String)->())->(){
        
        sm.connectForApiWith(url: EditProfileURL , mType: HTTPServerMethod.post, params: ["id":userId,"email":userMail,"phone":userPhone,"name":userName,"address":userAddress,"password":userPassword], complation: { (json) in
            
            if let obj = json {
                print (obj)
                
                var dictionaryOfJson = JSON(json!).dictionaryObject
                let userJson = dictionaryOfJson!["user"] as! [String : Any]
                let user = User.init(fromDictionary: userJson )
                self.user = user
                let msg = dictionaryOfJson!["msg"] as! String
                self.msg = msg
              
             
            }
            didDataReady(self.user,self.msg)
        }, errorHandler: { (error, msg) in
            print("\(String(describing: msg))")
            didDataReady(self.user,self.msg)
        })
    }
    
    func  getUserBalance(userId:String,didDataReady : @escaping(User,String,String,String)->())->(){
        
        sm.connectForApiWith(url: BaseURL , mType: HTTPServerMethod.post, params: ["id":userId], complation: { (json) in
            
            if let obj = json {
                print (obj)
                
                var dictionaryOfJson = JSON(json!).dictionaryObject
                let userJson = dictionaryOfJson!["user"] as! [String : Any]
                let user = User.init(fromDictionary: userJson )
                self.user = user
                let balance = dictionaryOfJson!["balance"] as! String
                self.balance = balance
                
                let last = dictionaryOfJson!["last"] as! String
                self.last = last
                
                let date = dictionaryOfJson!["date"] as! String
                self.date = date
            }
            didDataReady(self.user,self.balance,self.date,self.last)
        }, errorHandler: { (error, msg) in
            print("\(String(describing: msg))")
            didDataReady(User(),"","","")
        })
    }
}

