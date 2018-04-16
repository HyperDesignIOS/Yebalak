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
    var status : String!
    var withdrawArray : [WithdrawCompany] = []
    
    
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
                let active = dictionaryOfJson!["active"] as! String
                let msg = dictionaryOfJson!["msg"] as! String
                self.active = active
                
                if done == "1"{
                    print(dictionaryOfJson)
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
                else if done == "0"
                    
                {
                    if active == "0"
                    {
                    self.msg = msg
                    let items = dictionaryOfJson!["user"] as! [String : Any]
                    let item = User.init(fromDictionary: items)
                    self.user = item
                     self.done = done
                        
                    print("login failed enter acivation code ")
                    
                    }
                    else
                    {
                        self.active = active
                        self.done = done
                        self.msg = msg
                        self.user = User()
                        let date = dictionaryOfJson!["date"] as! String
                        self.date = date
                        let lastTransaction = dictionaryOfJson!["last"] as! String
                        self.last = lastTransaction
                    
                         print("login failed enter valid account")
                    }
                }
                
            }
            didDataReady(self.user,self.msg,self.done,self.active,self.date ?? "",self.last ?? "")
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
    
    func WithdrawForm(userPhone:String,userID:String,valval:String,paymentID:String,didDataReady : @escaping(String,String)->())->(){
        
        sm.connectForApiWith(url: WithdrawFormURL  , mType: HTTPServerMethod.post, params: ["phone":userPhone,"id":userID,"valal":valval,"payment":paymentID], complation: { (json) in
            
            if let obj = json {
                print (obj)
                
                var dictionaryOfJson = JSON(json!).dictionaryObject
                
                let msg = dictionaryOfJson!["msg"] as! String
                 self.msg = msg
                
                let status = dictionaryOfJson!["status"] as! String
                self.status = status
            
                
            }
            didDataReady(self.msg,self.status)
        }, errorHandler: { (error, msg) in
            print("\(String(describing: msg))")
            didDataReady("","")
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
}

