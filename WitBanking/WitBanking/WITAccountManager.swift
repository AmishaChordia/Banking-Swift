//
//  WITAccountMangaer.swift
//  WitBanking
//
//  Created by Chordia, Amisha (US - Mumbai) on 7/21/15.
//  Copyright (c) 2015 Chordia, Amisha (US - Mumbai). All rights reserved.
//

import UIKit
import LocalAuthentication


class WITAccountManager: NSObject {
  
    static func evaluateTouchIDAuthentication(completion : ((success : AnyObject? , authError : NSError?) -> Void)){
            let context = LAContext()
            var error : NSError?
            let authenticationString = "Please authenticate your credentials."
            if context.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: &error) {
                context.evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, localizedReason: authenticationString, reply: { (success, authError) -> Void in
                    
                      completion(success: success, authError: authError)
            
            })
        }
    }
}
