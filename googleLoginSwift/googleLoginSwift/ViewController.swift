//
//  ViewController.swift
//  googleLoginSwift
//
//  Created by Priyal Jain on 12/16/16.
//  Copyright © 2016 Priyal. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {

    @IBOutlet weak var signInButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set delegates
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        
        let buttonFrame : CGRect = CGRect.init(x: 0, y: 0, width: 100, height: 50)
          let gdSignInButton = GIDSignInButton.init(frame:buttonFrame)
        gdSignInButton.center = view.center
        view.addSubview(gdSignInButton)
        
        //  gdSignInButton.addTarget(self, action: #selector(self.didTapSignOut(sender: self.gdSignInButton)), for: UIControlEvents.touchUpInside)
    }

    @IBAction func didTapSignOut(sender: GIDSignInButton) {
        GIDSignIn.sharedInstance().signOut()
    }
    
     func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
        
        guard error == nil else {
            
            print("Error while trying to redirect : \(error)")
            return
        }
        
        print("Successful Redirection")
    }
    
    
    //MARK: GIDSignIn Delegate
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!)
    {
        if (error == nil) {
            // Perform any operations on signed in user here.
            let userId = user.userID                  // For client-side use only!
            print("User id is \(userId)")
            
            let idToken = user.authentication.idToken // Safe to send to the server
            print("Authentication idToken is \(idToken)")
            let fullName = user.profile.name
            print("User full name is \(fullName)")
            let givenName = user.profile.givenName
            print("User given profile name is \(givenName)")
            let familyName = user.profile.familyName
            print("User family name is \(familyName)")
            let email = user.profile.email
            print("User email address is \(email)")
            // ...
        } else {
            print("ERROR ::\(error.localizedDescription)")
        }
    }
    
    // Finished disconnecting |user| from the app successfully if |error| is |nil|.
    public func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!)
    {
        
    }


    
}

