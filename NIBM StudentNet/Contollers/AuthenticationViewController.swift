//
//  AuthenticationViewController.swift
//  NIBM StudentNet
//
//  Created by Sandeepa Manawadu on 2019/07/19.
//  Copyright © 2019 Tuhan Sapumanage. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class AuthenticationViewController: UIViewController {
    
    //outlets for the UI elements
    @IBOutlet weak var topLogo: UIImageView!
    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var doBtnLogin: UIButton!
    @IBOutlet weak var doBtnForgotPassword: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.doBtnLogin.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
    
    // action - doBtnLogin
    @IBAction func doBtnLogin(_ sender: UIButton) {
        
        Auth.auth().signIn(withEmail: self.tfUsername.text!, password: self.tfPassword.text!) { [weak self] user, error in
            guard let strongSelf = self else { return }
            
            // Login alert if prompted
            if error != nil{
                let alert = UIAlertController(title: "Error in Login", message: error? .localizedDescription, preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
                strongSelf.present(alert, animated: true, completion: nil)
                
            } else {
                strongSelf.dismiss(animated: true, completion: nil)
            }
        }
        
        //Hide the SW keyboard
        self.tfUsername.resignFirstResponder()
        self.tfPassword.resignFirstResponder()    }
    
    // action - doBtnForgotPassword
    @IBAction func doBtnForgotPassword(_ sender: UIButton) {
        //Hide the SW keyboard
        self.tfUsername.resignFirstResponder()
        self.tfPassword.resignFirstResponder()    }
    
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
