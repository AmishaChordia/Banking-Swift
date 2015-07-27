//
//  WITEntityModel.swift
//  WitBanking
//
//  Created by Chordia, Amisha (US - Mumbai) on 7/27/15.
//  Copyright © 2015 Chordia, Amisha (US - Mumbai). All rights reserved.
//

import UIKit

let WITContact = "contact"
let WITMoney = "amount_of_money"
let value = "value"

class WITEntityModel: NSObject {
    
    var amountMoney : NSDictionary?
    var contact : NSDictionary?
    var contactValue : String?
    var amountMoneyValue : NSInteger?

    init(dict : NSDictionary) {
        if let userAmount : NSArray = dict.valueForKey(WITMoney) as? NSArray {
            amountMoney = userAmount.firstObject as? NSDictionary
            
            if amountMoney != nil {
                amountMoneyValue = amountMoney?.valueForKey(value) as? NSInteger
            }
            
            
        }
        if let userContact : NSArray = dict.valueForKey(WITContact) as? NSArray {
            contact = userContact.firstObject as? NSDictionary
            if contact != nil {
                contactValue = contact?.valueForKey(value) as? String
            }
            
        }
    }

}
