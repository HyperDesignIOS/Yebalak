//
//  User.swift
//  Yebalak
//
//  Created by AmrObjection on 4/11/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import Foundation


import Foundation


class User : NSObject, NSCoding{
    
    var address : String!
    var admin : String!
    var balance : String!
    var createdAt : String!
    var email : String!
    var facebookId : String!
    var googleId : String!
    var id : Int!
    var name : String!
    var phone : String!
    var status : Int!
    var updatedAt : String!
    var verifiedCode : String!
    
    
    override init() {
        
    }
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        address = dictionary["address"] as? String ?? ""
        admin = dictionary["admin"] as? String ?? ""
        balance = dictionary["balance"] as? String ?? ""
        createdAt = dictionary["created_at"] as? String ?? ""
        email = dictionary["email"] as? String ?? ""
        facebookId = dictionary["facebook_id"] as? String ?? ""
        googleId = dictionary["google_id"] as? String ?? ""
        id = dictionary["id"] as? Int ?? 0
        name = dictionary["name"] as? String ?? ""
        phone = dictionary["phone"] as? String ?? ""
        status = dictionary["status"] as? Int ?? 0
        updatedAt = dictionary["updated_at"] as? String ?? ""
        verifiedCode = dictionary["verified_code"] as? String ?? ""
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if address != nil{
            dictionary["address"] = address
        }
        if admin != nil{
            dictionary["admin"] = admin
        }
        if balance != nil{
            dictionary["balance"] = balance
        }
        if createdAt != nil{
            dictionary["created_at"] = createdAt
        }
        if email != nil{
            dictionary["email"] = email
        }
        if facebookId != nil{
            dictionary["facebook_id"] = facebookId
        }
        if googleId != nil{
            dictionary["google_id"] = googleId
        }
        if id != nil{
            dictionary["id"] = id
        }
        if name != nil{
            dictionary["name"] = name
        }
        if phone != nil{
            dictionary["phone"] = phone
        }
        if status != nil{
            dictionary["status"] = status
        }
        if updatedAt != nil{
            dictionary["updated_at"] = updatedAt
        }
        if verifiedCode != nil{
            dictionary["verified_code"] = verifiedCode
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        address = aDecoder.decodeObject(forKey: "address") as? String ?? ""
        admin = aDecoder.decodeObject(forKey: "admin") as? String ?? ""
        balance = aDecoder.decodeObject(forKey: "balance") as? String ?? ""
        createdAt = aDecoder.decodeObject(forKey: "created_at") as? String ?? ""
        email = aDecoder.decodeObject(forKey: "email") as? String ?? ""
        facebookId = aDecoder.decodeObject(forKey: "facebook_id") as? String ?? ""
        googleId = aDecoder.decodeObject(forKey: "google_id") as? String  ?? ""
        id = aDecoder.decodeObject(forKey: "id") as? Int ?? 0
        name = aDecoder.decodeObject(forKey: "name") as? String ?? ""
        phone = aDecoder.decodeObject(forKey: "phone") as? String ?? ""
        status = aDecoder.decodeObject(forKey: "status") as? Int ?? 0
        updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String ?? ""
        verifiedCode = aDecoder.decodeObject(forKey: "verified_code") as? String ?? ""
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if address != nil{
            aCoder.encode(address, forKey: "address")
        }
        if admin != nil{
            aCoder.encode(admin, forKey: "admin")
        }
        if balance != nil{
            aCoder.encode(balance, forKey: "balance")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if email != nil{
            aCoder.encode(email, forKey: "email")
        }
        if facebookId != nil{
            aCoder.encode(facebookId, forKey: "facebook_id")
        }
        if googleId != nil{
            aCoder.encode(googleId, forKey: "google_id")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if phone != nil{
            aCoder.encode(phone, forKey: "phone")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }
        if verifiedCode != nil{
            aCoder.encode(verifiedCode, forKey: "verified_code")
        }
        
    }
    
}
