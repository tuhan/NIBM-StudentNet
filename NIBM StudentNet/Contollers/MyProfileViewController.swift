//
//  MyProfileViewController.swift
//  NIBM StudentNet
//
//  Created by Sandeepa Manawadu on 2019/07/20.
//  Copyright © 2019 Tuhan Sapumanage. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class MyProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func doBtnSignOut(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        // dismiss the signout page
        self.navigationController?.dismiss(animated: true)
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
