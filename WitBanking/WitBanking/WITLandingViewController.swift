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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Wit.sharedInstance().delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func witDidGraspIntent(outcomes: [AnyObject]!, messageId: String!, customData: AnyObject!, error e: NSError!) {
//        NSDictionary *firstOutcome = [outcomes objectAtIndex:0];
//        NSString *intent = [firstOutcome objectForKey:@"intent"];
//        
//        labelView.text = [NSString stringWithFormat:@"intent = %@", intent];
        
        let outcomeArray = outcomes as NSArray!
        
        let firstOutcome = outcomeArray.firstObject as! NSDictionary!
        
        let intentString : String = firstOutcome.objectForKey("intent") as! String
        
        intentLabel.text = "intent = " + intentString
        

    }
}
