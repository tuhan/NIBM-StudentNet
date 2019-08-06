// ToDo: Setting vote count and handling how its being adjust
// Retriving answers list and displaying them here
// Clicking add answer and modaly to submit my answer
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
    var questionsList: [Question] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Refresh", style: .plain, target: self, action: #selector(refreshTapped))

        self.title = selectedCategoryName
        getQuestionsList()
    }
    
    // Reshing the list
    @objc func refreshTapped () {
        getQuestionsList()
    }
    
    // MARK: Table view methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionTableViewCell", for: indexPath) as! QuestionTableViewCell
        cell.questionTitle.text = questionsList[indexPath.row].questionTitle
        cell.questionDescription.text = questionsList[indexPath.row].questionDesc
        
        // MARK: Setting the answer count & making sure to remove Optional part
        if let questionAnswerCount = questionsList[indexPath.row].questionAnswerCount {
            
            var questionAnswerCountToShow: String!
            
            if (Int(questionAnswerCount)) > 99 {
                questionAnswerCountToShow = "99+"
            }
            else
            {
                questionAnswerCountToShow = "\(questionAnswerCount)"
            }
            
            if questionsList[indexPath.row].questionStatus == "solved" {

            }
            else if questionsList[indexPath.row].questionStatus == "unsolved"{
                cell.questionAnswerCount.textColor = UIColor.black
            }
            else if questionsList[indexPath.row].questionStatus == "restricted"{
                cell.questionAnswerCount.textColor = UIColor.red
            }
            
            cell.questionAnswerCount.text = questionAnswerCountToShow
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 82;//Choose your custom row height
    }
    
}

// MARK: Getting questions list from the Firebase

extension CategorySelectedViewController {
    
    func getQuestionsList (){
        ref = Database.database().reference()
        self.ref.child("questions").child(selectedCategoryID).observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as! NSDictionary
            
            // Any Print Statement if Needed to Debug
            
            var tempQuestionsList: [Question] = []
            
            if snapshot.childrenCount > 0 {
                for question in snapshot.children.allObjects as! [DataSnapshot] {
                    
                    let incomingQuestion = question.value as! [String: AnyObject]
                    let question = Question(questionID: incomingQuestion["question_id"] as! String, questionTitle: incomingQuestion["title"] as! String, questionDesc: incomingQuestion["description"] as! String, questionPostedBy: incomingQuestion["posted_by"] as! String, questionStatus: incomingQuestion["status"] as! String, questionAnswerCount: incomingQuestion["answer_count"] as! Int, questionDate: incomingQuestion["date"] as! String, questionTime: incomingQuestion["time"] as! String, votesCount: incomingQuestion["votes"] as! Int)
                    
                    tempQuestionsList.append(question)
                }
            }
            
            self.questionsList = tempQuestionsList
            self.tableView.reloadData()
            
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    // MARK: Preparing for Segue
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "QuestionSelectedSegue", sender: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // Fires when the cell is clicked, preparing for the segue to set destination view required variables
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Validating and seeing if the incoming segue is the needed one
        if segue.identifier == "QuestionSelectedSegue" {
            
            let indexPassed: Int = sender as! Int
            let destinationVC = segue.destination as! QuestionSelectedViewController // INITIALIZING LANDING VIEW CONTROLLER
            destinationVC.questionSelected = questionsList[indexPassed]
        }
    }
    
}


