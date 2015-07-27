//
//  WITLoginViewController.swift
//  WitBanking
//
//  Created by Chordia, Amisha (US - Mumbai) on 7/7/15.
//  Copyright (c) 2015 Chordia, Amisha (US - Mumbai). All rights reserved.
//

import UIKit

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
    
    //MARK: Login Authentication
    
    func checkForSavedCredentials() -> Bool {
        if let savedUserName : AnyObject = NSUserDefaults.standardUserDefaults().valueForKey(WITConstants.kUsername) {
            userName.text = savedUserName as? String
            return true
        }
        return false
    }
    
    func authenticateUser() {
        WITAccountManager.evaluateTouchIDAuthentication ({ (success, error) -> Void in
            dispatch_async(dispatch_get_main_queue(),{
                if ((error == nil ) && (success != nil)) {
                    self.pushToLandingViewController()
                }
            })
        })
    }
    
    //MARK: Login Validation
    
    func validateTextFields() {
        if (userName.text?.characters.count > 0){
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
    
    //MARK: IBAction
    
    @IBAction func loginTapped(sender: UIButton) {
        validateTextFields()
    }
    
    func pushToLandingViewController() {
        self.password.text = self.userKeychainWrapper.myObjectForKey("v_Data") as? String
        let landingView = storyboard?.instantiateViewControllerWithIdentifier("WITLandingViewController") as! WITLandingViewController
        navigationController?.pushViewController(landingView, animated: true)
    }
}
