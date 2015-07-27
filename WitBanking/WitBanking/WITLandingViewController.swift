//
//  WITLandingViewController.swift
//  WitBanking
//
//  Created by Chordia, Amisha (US - Mumbai) on 7/2/15.
//  Copyright (c) 2015 Chordia, Amisha (US - Mumbai). All rights reserved.
//

import UIKit

class WITLandingViewController: UIViewController , WitDelegate {

    @IBOutlet weak var intentLabel: UILabel!
    var intent : String?
    var intentModel : WITIntentModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        Wit.sharedInstance().delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Wit Delegate

    func witDidGraspIntent(outcomes: [AnyObject]!, messageId: String!, customData: AnyObject!, error e: NSError!) {
        
        if (e != nil) {
            
        }
        else {
            if outcomes != nil && outcomes.count > 0 {
                
                if let dict = outcomes.first as? NSDictionary {
                    intentModel = WITIntentModel(dict: dict)
                    if intentModel?.intent == WITConstants.WITBlockCard {
                        
                    }
                    if intentModel?.intent == WITConstants.WITTransferMoney {
                        
                    }
                    
                }
                
            }
            
            if let appendString = self.intentModel?.intent {
                intentLabel.text = "intent = " + appendString
            }
        }
    }
}
