//
//  ConfirmEmailViewController.swift
//  NIBM StudentNet
//
//  Created by Tuhan Sapumanage on 8/7/19.
//  Copyright © 2019 Tuhan Sapumanage. All rights reserved.
//

import UIKit

class ConfirmEmailViewController: UIViewController {

    @IBOutlet weak var confirmButton: UIView!
    @IBOutlet weak var otpCodeTxt: UITextField!
    var studentInfo: Student!
    var otp: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.confirmButton.layer.cornerRadius = 10
        print(studentInfo.studentFirstName)
        print(otp)
    }
    
    @IBAction func confirmBtnClicked(_ sender: Any) {
        
        // Validate email provided and check if it matches the code mailed by
        
        // 1. Retriving the code sent that matches the given email from Firebase
        // 2. If it matches save user and navigate to add password page
        
    }
    
}
