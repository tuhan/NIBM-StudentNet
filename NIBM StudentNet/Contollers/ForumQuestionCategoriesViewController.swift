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
        
        if let questionCategory = questionCategoryList[indexPath.row].questionCategory {
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
                    let questioncategory = QuestionCategory(questionCategory: incomingQuestionCategory["category"] as! String, questionCount: incomingQuestionCategory["count"] as! Int8)
                        tempQestionCategory.append(questioncategory)
                }
            }

            self.questionCategoryList = tempQestionCategory
            self.tableView.reloadData()

        }) { (error) in
            print(error.localizedDescription)
        }
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
