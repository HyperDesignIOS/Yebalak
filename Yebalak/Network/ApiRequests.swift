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
    
    
    
    func  register(userName:String,userPassword:String,userPhone:String,userMail:String,didDataReady : @escaping(User,String,String)->())->(){
        
        sm.connectForApiWith(url: RegisterURL , mType: HTTPServerMethod.post, params: ["username":userName,"password":userPassword,"phone":userPhone,"email":userMail], complation: { (json) in
            
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
                    
                }
                else                 {
                    let msg = dictionaryOfJson!["msg"] as! String
                    self.msg = msg
                    print("login failed check ")
                    self.user = nil
                    self.done = done
                    
                }
            }
            didDataReady(self.user,self.msg,self.done)
        }, errorHandler: { (error, msg) in
            print("\(String(describing: msg))")
            didDataReady(self.user,self.msg,self.done)
        })
    }
    
    func login(userMail:String,userPassword:String,didDataReady : @escaping(User,String,String)->())->(){
        
        sm.connectForApiWith(url: LoginURL  , mType: HTTPServerMethod.post, params: ["email":userMail,"password":userPassword], complation: { (json) in
            
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
                    
                }
                else if done == "0"
                {
                    let msg = dictionaryOfJson!["msg"] as! String
                    self.msg = msg
                    print("login failed check ")
                    self.user = nil
                    self.done = done
                    
                }
            }
            didDataReady(self.user,self.msg,self.done)
        }, errorHandler: { (error, msg) in
            print("\(String(describing: msg))")
            didDataReady(self.user, msg as! String,self.done)
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
                    self.user = nil
                    self.done = done
                    
                }
            }
            didDataReady(self.user,self.msg,self.done,self.balance,self.date,self.last)
        }, errorHandler: { (error, msg) in
            print("\(String(describing: msg))")
            didDataReady(self.user,self.msg,self.done,self.balance,self.date,self.last)
        })
    }
    
}

