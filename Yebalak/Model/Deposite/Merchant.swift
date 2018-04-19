//
//  Merchant.swift
//  Yebalak
//
//  Created by AmrObjection on 4/16/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import Foundation


class Merchant : NSObject, NSCoding{
    
    var balance : String!
    var createdAt : String!
    var id : Int!
    var logo : String!
    var nameAr : String!
    var nameEn : String!
    var updatedAt : String!
    var userId : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        balance = dictionary["balance"] as? String ?? ""
        createdAt = dictionary["created_at"] as? String ?? ""
        id = dictionary["id"] as? Int ?? 0
        logo = dictionary["logo"] as? String ?? ""
        nameAr = dictionary["name_ar"] as? String ?? ""
        nameEn = dictionary["name_en"] as? String ?? ""
        updatedAt = dictionary["updated_at"] as? String ?? ""
        userId = dictionary["user_id"] as? String ?? ""
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if balance != nil{
            dictionary["balance"] = balance
        }
        if createdAt != nil{
            dictionary["created_at"] = createdAt
        }
        if id != nil{
            dictionary["id"] = id
        }
        if logo != nil{
            dictionary["logo"] = logo
        }
        if nameAr != nil{
            dictionary["name_ar"] = nameAr
        }
        if nameEn != nil{
            dictionary["name_en"] = nameEn
        }
        if updatedAt != nil{
            dictionary["updated_at"] = updatedAt
        }
        if userId != nil{
            dictionary["user_id"] = userId
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        balance = aDecoder.decodeObject(forKey: "balance") as? String ?? ""
        createdAt = aDecoder.decodeObject(forKey: "created_at") as? String ?? ""
        id = aDecoder.decodeObject(forKey: "id") as? Int ?? 0
        logo = aDecoder.decodeObject(forKey: "logo") as? String ?? ""
        nameAr = aDecoder.decodeObject(forKey: "name_ar") as? String ?? ""
        nameEn = aDecoder.decodeObject(forKey: "name_en") as? String ?? ""
        updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String ?? ""
        userId = aDecoder.decodeObject(forKey: "user_id") as? String ?? ""
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if balance != nil{
            aCoder.encode(balance, forKey: "balance")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if logo != nil{
            aCoder.encode(logo, forKey: "logo")
        }
        if nameAr != nil{
            aCoder.encode(nameAr, forKey: "name_ar")
        }
        if nameEn != nil{
            aCoder.encode(nameEn, forKey: "name_en")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }
        if userId != nil{
            aCoder.encode(userId, forKey: "user_id")
        }
        
    }
    
}
