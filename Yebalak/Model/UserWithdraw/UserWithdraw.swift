//
//  UserWithdraw.swift
//  Yebalak
//
//  Created by AmrObjection on 4/17/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import Foundation


class Userwithdraw : NSObject, NSCoding{
    
    var date : String!
    var nameAr : String!
    var nameEn : String!
    var phone : String!
    var status : String!
    var userId : String!
    var value : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        date = dictionary["date"] as? String ?? ""
        nameAr = dictionary["name_ar"] as? String ?? ""
        nameEn = dictionary["name_en"] as? String ?? ""
        phone = dictionary["phone"] as? String ?? ""
        status = dictionary["status"] as? String ?? ""
        userId = dictionary["user_id"] as? String ?? ""
        value = dictionary["value"] as? String ?? ""
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if date != nil{
            dictionary["date"] = date
        }
        if nameAr != nil{
            dictionary["name_ar"] = nameAr
        }
        if nameEn != nil{
            dictionary["name_en"] = nameEn
        }
        if phone != nil{
            dictionary["phone"] = phone
        }
        if status != nil{
            dictionary["status"] = status
        }
        if userId != nil{
            dictionary["user_id"] = userId
        }
        if value != nil{
            dictionary["value"] = value
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        date = aDecoder.decodeObject(forKey: "date") as? String ?? ""
        nameAr = aDecoder.decodeObject(forKey: "name_ar") as? String ?? ""
        nameEn = aDecoder.decodeObject(forKey: "name_en") as? String ?? ""
        phone = aDecoder.decodeObject(forKey: "phone") as? String ?? ""
        status = aDecoder.decodeObject(forKey: "status") as? String ?? ""
        userId = aDecoder.decodeObject(forKey: "user_id") as? String ?? ""
        value = aDecoder.decodeObject(forKey: "value") as? String ?? ""
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if date != nil{
            aCoder.encode(date, forKey: "created_at")
        }
        if nameAr != nil{
            aCoder.encode(nameAr, forKey: "name_ar")
        }
        if nameEn != nil{
            aCoder.encode(nameEn, forKey: "name_en")
        }
        if phone != nil{
            aCoder.encode(phone, forKey: "phone")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        if userId != nil{
            aCoder.encode(userId, forKey: "user_id")
        }
        if value != nil{
            aCoder.encode(value, forKey: "value")
        }
        
    }
    
}
