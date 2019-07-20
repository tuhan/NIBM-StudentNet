//
//  ForgotPasswordViewController.swift
//  NIBM StudentNet
//
//  Created by Sandeepa Manawadu on 2019/07/20.
//  Copyright © 2019 Tuhan Sapumanage. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ForgotPasswordViewController: UIViewController {
    
     //outlets for the UI elements
    @IBOutlet weak var tfForgotPassword: UITextField!
    @IBOutlet weak var doBtnResetPassword: UIButton!
    @IBOutlet weak var doBtnCancel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    // action - doBtnResetPassword
    @IBAction func doBtnResetPassword(_ sender: UIButton) {
        let email = self.tfForgotPassword.text!
        if email != "" {
            Auth.auth().sendPasswordReset(withEmail: email) { error in
                if error != nil {
                    print(error?.localizedDescription as Any)
                    return
                } else {
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
        // Hide the SW keyboard
        self.tfForgotPassword.resignFirstResponder()
    }
    
    // action - doBtnCancel
    @IBAction func doBtnCancel(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
        // Hide the SW keyboard
        self.tfForgotPassword.resignFirstResponder()
    }
    
    //Hide the SW keyboard when the user touch anywhere else
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
