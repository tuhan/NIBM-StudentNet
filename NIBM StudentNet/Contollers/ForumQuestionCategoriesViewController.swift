//
//  ForumQuestionCategoriesViewController.swift
//  NIBM StudentNet
//
//  Created by Tuhan Sapumanage on 8/5/19.
//  Copyright © 2019 Tuhan Sapumanage. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class ForumQuestionCategoriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    var ref: DatabaseReference!
    var questionCategoryList: [QuestionCategory] = []

    // MARK: Setting table view properties
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionCategoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ForumQuestionCategoriesTableViewCell", for: indexPath) as! ForumQuestionCategoriesTableViewCell
        
        if let questionCategory = questionCategoryList[indexPath.row].questionCategoryName {
            if let questionCount = questionCategoryList[indexPath.row].questionCount {
                cell.categoryTitle.text = "\(questionCategory) (\(questionCount))"
            }
        }
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getCategoriesList ()
    }
    
    func getCategoriesList (){
        ref = Database.database().reference()
        self.ref.child("question_categories").observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as! NSDictionary
            
            // Any Print Statement if Needed to Debug
            
            var tempQestionCategory: [QuestionCategory] = []

            if snapshot.childrenCount > 0 {
                for questioncategory in snapshot.children.allObjects as! [DataSnapshot] {

                    let incomingQuestionCategory = questioncategory.value as! [String: AnyObject]
                    let questioncategory = QuestionCategory(questionCategoryID: incomingQuestionCategory["category_id"] as! String, questionCategoryName: incomingQuestionCategory["category"] as! String, questionCount: incomingQuestionCategory["count"] as! Int8)
                        tempQestionCategory.append(questioncategory)
                }
            }

            self.questionCategoryList = tempQestionCategory
            self.tableView.reloadData()

        }) { (error) in
            print(error.localizedDescription)
        }
    }
}

extension ForumQuestionCategoriesViewController {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "CategorySelectedSegue", sender: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // Fires when the cell is clicked, preparing for the segue to set destination view required variables
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Validating and seeing if the incoming segue is the needed one
        if segue.identifier == "CategorySelectedSegue" {
            
            let indexPassed: Int = sender as! Int
            let destinationVC = segue.destination as! CategorySelectedViewController // INITIALIZING LANDING VIEW CONTROLLER
            destinationVC.selectedCategoryID = questionCategoryList[indexPassed].questionCategoryID
            destinationVC.selectedCategoryName = questionCategoryList[indexPassed].questionCategoryName
        }
    }
}
