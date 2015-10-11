//
//  ViewController.swift
//  App1
//
//  Created by olivia hsu on 10/3/15.
//  Copyright © 2015 olivia hsu. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {
    //MARK: Properties
    @IBOutlet weak var nameTextField: UIStackView!
    @IBOutlet weak var usernameNameLabel: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if(FBSDKAccessToken.currentAccessToken() == nil){
            print("Not Logged In")
        }
        else{
            print("Logged In")
        }
        
        var loginButton = FBSDKLoginButton()
        loginButton.readPermissions = (["public_profile", "email", "user_friends"])
        loginButton.center = self.view.center
        let p = self.view.center.x
        let vertical_align = self.view.frame.size.height - loginButton.frame.height - 40
        loginButton.center = CGPoint(x: p, y: vertical_align)
        
        loginButton.delegate = self
        self.view.addSubview(loginButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: --Facebook Login
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!){
        
        if error == nil{
            print("Login Complete")
            self.performSegueWithIdentifier("showNew", sender: self)
        }
        else{
            print(error.localizedDescription)
        }
        
    }
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!){
        print("User Logged Out")
    }


}

