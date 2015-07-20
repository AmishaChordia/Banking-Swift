//
//  WITLoginViewController.swift
//  WitBanking
//
//  Created by Chordia, Amisha (US - Mumbai) on 7/7/15.
//  Copyright (c) 2015 Chordia, Amisha (US - Mumbai). All rights reserved.
//

import UIKit
import LocalAuthentication

class WITLoginViewController: UIViewController {

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var userName: UITextField!
    let userKeychainWrapper = KeychainWrapper()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if checkForSavedCredentials(){
            authenticateUser()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkForSavedCredentials() -> Bool {
        if let savedUserName : AnyObject = NSUserDefaults.standardUserDefaults().valueForKey(WITConstants.kUsername) {
            userName.text = savedUserName as! String
            return true
        }
        return false
    }
    
    func authenticateUser() {
        let context = LAContext()
        var error : NSError?
        let authenticationString = "Please authenticate your credentials."
        if context.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, localizedReason: authenticationString, reply: { (success, authError) -> Void in
                
                
                dispatch_async(dispatch_get_main_queue(),{
                if success {
                   self.pushToLandingViewController()
                    
                }
                else{
                    // If authentication failed then show a message to the console with a short description.
                    // In case that the error is a user fallback, then show the password alert view.
                    println(authError?.localizedDescription)
                    
                    switch authError!.code {
                        
                    case LAError.SystemCancel.rawValue:
                        println("Authentication was cancelled by the system")
                        
                    case LAError.UserCancel.rawValue:
                        println("Authentication was cancelled by the user")
                        
                    case LAError.UserFallback.rawValue:
                        println("User selected to enter custom password")
                        NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                        })
                        
                    default:
                        println("Authentication failed")
                        NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                        })
                    }
                }
            })
            })

        }
    }

    func validateTextFields() {
        if (count(userName.text) > 0){
            if password.text == WITConstants.kPassword {
               // segue - code
                NSUserDefaults.standardUserDefaults().setValue(userName.text, forKey: WITConstants.kUsername)
                userKeychainWrapper.mySetObject(password.text, forKey: kSecValueData)
                userKeychainWrapper.writeToKeychain()
                pushToLandingViewController()
            }
            else{
                password.backgroundColor = UIColor.WITErrorCellColor()
            }
        }
        else{
            userName.backgroundColor = UIColor.WITErrorCellColor()
        }
            
    }
    
    @IBAction func loginTapped(sender: UIButton) {
       // authenticateUser()
        validateTextFields()
    }
    
    func pushToLandingViewController() {
        let landingView = storyboard?.instantiateViewControllerWithIdentifier("WITLandingViewController") as! WITLandingViewController
        navigationController?.pushViewController(landingView, animated: true)
    }
}
