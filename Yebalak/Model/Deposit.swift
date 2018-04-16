//
//  Deposit.swift
//  Yebalak
//
//  Created by AmrObjection on 4/16/18.
//  Copyright © 2018 AmrObjection. All rights reserved.
//

import Foundation


class Deposit : NSObject, NSCoding{
    
    var branche : Branche!
    var createdAt : String!
    var date : String!
    var id : Int!
    var macAddress : String!
    var merchant : Merchant!
    var merchantBrancheId : String!
    var merchantDeviceId : String!
    var merchantDevices : MerchantDevice!
    var merchantId : String!
    var phone : String!
    var status : String!
    var updatedAt : String!
    var userId : String!
    var value : String!
    var vendorUserId : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        if let brancheData = dictionary["branche"] as? [String:Any]{
            branche = Branche(fromDictionary: brancheData)
        }
        createdAt = dictionary["created_at"] as? String
        date = dictionary["date"] as? String
        id = dictionary["id"] as? Int
        macAddress = dictionary["mac_address"] as? String
        if let merchantData = dictionary["merchant"] as? [String:Any]{
            merchant = Merchant(fromDictionary: merchantData)
        }
        merchantBrancheId = dictionary["merchant_branche_id"] as? String
        merchantDeviceId = dictionary["merchant_device_id"] as? String
        if let merchantDevicesData = dictionary["merchant_devices"] as? [String:Any]{
            merchantDevices = MerchantDevice(fromDictionary: merchantDevicesData)
        }
        merchantId = dictionary["merchant_id"] as? String
        phone = dictionary["phone"] as? String
        status = dictionary["status"] as? String
        updatedAt = dictionary["updated_at"] as? String
        userId = dictionary["user_id"] as? String
        value = dictionary["value"] as? String
        vendorUserId = dictionary["vendor_user_id"] as? String
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if branche != nil{
            dictionary["branche"] = branche.toDictionary()
        }
        if createdAt != nil{
            dictionary["created_at"] = createdAt
        }
        if date != nil{
            dictionary["date"] = date
        }
        if id != nil{
            dictionary["id"] = id
        }
        if macAddress != nil{
            dictionary["mac_address"] = macAddress
        }
        if merchant != nil{
            dictionary["merchant"] = merchant.toDictionary()
        }
        if merchantBrancheId != nil{
            dictionary["merchant_branche_id"] = merchantBrancheId
        }
        if merchantDeviceId != nil{
            dictionary["merchant_device_id"] = merchantDeviceId
        }
        if merchantDevices != nil{
            dictionary["merchant_devices"] = merchantDevices.toDictionary()
        }
        if merchantId != nil{
            dictionary["merchant_id"] = merchantId
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
        if userId != nil{
            dictionary["user_id"] = userId
        }
        if value != nil{
            dictionary["value"] = value
        }
        if vendorUserId != nil{
            dictionary["vendor_user_id"] = vendorUserId
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        branche = aDecoder.decodeObject(forKey: "branche") as? Branche
        createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
        date = aDecoder.decodeObject(forKey: "date") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        macAddress = aDecoder.decodeObject(forKey: "mac_address") as? String
        merchant = aDecoder.decodeObject(forKey: "merchant") as? Merchant
        merchantBrancheId = aDecoder.decodeObject(forKey: "merchant_branche_id") as? String
        merchantDeviceId = aDecoder.decodeObject(forKey: "merchant_device_id") as? String
        merchantDevices = aDecoder.decodeObject(forKey: "merchant_devices") as? MerchantDevice
        merchantId = aDecoder.decodeObject(forKey: "merchant_id") as? String
        phone = aDecoder.decodeObject(forKey: "phone") as? String
        status = aDecoder.decodeObject(forKey: "status") as? String
        updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
        userId = aDecoder.decodeObject(forKey: "user_id") as? String
        value = aDecoder.decodeObject(forKey: "value") as? String
        vendorUserId = aDecoder.decodeObject(forKey: "vendor_user_id") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if branche != nil{
            aCoder.encode(branche, forKey: "branche")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if date != nil{
            aCoder.encode(date, forKey: "date")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if macAddress != nil{
            aCoder.encode(macAddress, forKey: "mac_address")
        }
        if merchant != nil{
            aCoder.encode(merchant, forKey: "merchant")
        }
        if merchantBrancheId != nil{
            aCoder.encode(merchantBrancheId, forKey: "merchant_branche_id")
        }
        if merchantDeviceId != nil{
            aCoder.encode(merchantDeviceId, forKey: "merchant_device_id")
        }
        if merchantDevices != nil{
            aCoder.encode(merchantDevices, forKey: "merchant_devices")
        }
        if merchantId != nil{
            aCoder.encode(merchantId, forKey: "merchant_id")
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
        if userId != nil{
            aCoder.encode(userId, forKey: "user_id")
        }
        if value != nil{
            aCoder.encode(value, forKey: "value")
        }
        if vendorUserId != nil{
            aCoder.encode(vendorUserId, forKey: "vendor_user_id")
        }
        
    }
    
}
