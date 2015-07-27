//
//  WITIntentModel.swift
//  WitBanking
//
//  Created by Chordia, Amisha (US - Mumbai) on 7/27/15.
//  Copyright © 2015 Chordia, Amisha (US - Mumbai). All rights reserved.
//

import UIKit

let WITIntent = "intent"
let WITEntities = "entities"

class WITIntentModel: NSObject {
    
    var intent : String?
    var entity : WITEntityModel?
    
    
     init(dict : NSDictionary){
        if let userIntent: AnyObject = dict.valueForKey(WITIntent) {
            intent = userIntent as? String
        }
        
        if intent == WITConstants.WITTransferMoney{
            if let userEntity: NSDictionary = dict.valueForKey(WITEntities) as? NSDictionary {
                entity =  WITEntityModel(dict: userEntity)
                
            }
        }
        
        
    }

}
