//
//  ViewController.swift
//  NIBM StudentNet
//
//  Created by Tuhan Sapumanage on 7/17/19.
//  Copyright © 2019 Tuhan Sapumanage. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // user authentication handling via the AppTempData class
        
        AppTempData.userHandler = Auth.auth().addStateDidChangeListener{(auth, user) in
       // check whether is there a user who has already logged in ?
            if user == nil {
                self.performSegue(withIdentifier: "Authentication", sender: nil)
                
            }
            else {
                self.performSegue(withIdentifier: "Home", sender: nil)
            }
              }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        <#code#>
    }
}

