//
//  CategorySelectedViewController.swift
//  NIBM StudentNet
//
//  Created by Tuhan Sapumanage on 8/5/19.
//  Copyright © 2019 Tuhan Sapumanage. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class CategorySelectedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var ref: DatabaseReference!
    
    var selectedCategoryName: String!
    var selectedCategoryID: String!
    var questionCategoryList: [QuestionCategory] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = selectedCategoryName
    }
    
    // MARK: Table view methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionTableViewCell", for: indexPath) as! QuestionTableViewCell
        cell.questionTitle.text = "What is the best algorithm?"
        cell.questionDescription.text = "What is the best alogorithm to sort a list of 500,000 names using NodeJS?"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 82;//Choose your custom row height
    }
    
}
