//
//  MerchantDevice.swift
//  Yebalak
//
//  Created by AmrObjection on 4/16/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//


import Foundation


class MerchantDevice : NSObject, NSCoding{
    
    var createdAt : String!
    var id : Int!
    var macAddress : String!
    var merchantBrancheId : String!
    var merchantId : String!
    var name : String!
    var updatedAt : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        createdAt = dictionary["created_at"] as? String ?? ""
        id = dictionary["id"] as? Int ?? 0
        macAddress = dictionary["mac_address"] as? String ?? ""
        merchantBrancheId = dictionary["merchant_branche_id"] as? String ?? ""
        merchantId = dictionary["merchant_id"] as? String ?? ""
        name = dictionary["name"] as? String ?? ""
        updatedAt = dictionary["updated_at"] as? String ?? ""
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if createdAt != nil{
            dictionary["created_at"] = createdAt
        }
        if id != nil{
            dictionary["id"] = id
        }
        if macAddress != nil{
            dictionary["mac_address"] = macAddress
        }
        if merchantBrancheId != nil{
            dictionary["merchant_branche_id"] = merchantBrancheId
        }
        if merchantId != nil{
            dictionary["merchant_id"] = merchantId
        }
        if name != nil{
            dictionary["name"] = name
        }
        if updatedAt != nil{
            dictionary["updated_at"] = updatedAt
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        createdAt = aDecoder.decodeObject(forKey: "created_at") as? String ?? ""
        id = aDecoder.decodeObject(forKey: "id") as? Int ?? 0
        macAddress = aDecoder.decodeObject(forKey: "mac_address") as? String ?? ""
        merchantBrancheId = aDecoder.decodeObject(forKey: "merchant_branche_id") as? String ?? ""
        merchantId = aDecoder.decodeObject(forKey: "merchant_id") as? String ?? ""
        name = aDecoder.decodeObject(forKey: "name") as? String ?? ""
        updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String ?? ""
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if macAddress != nil{
            aCoder.encode(macAddress, forKey: "mac_address")
        }
        if merchantBrancheId != nil{
            aCoder.encode(merchantBrancheId, forKey: "merchant_branche_id")
        }
        if merchantId != nil{
            aCoder.encode(merchantId, forKey: "merchant_id")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }
        
    }
    
}
