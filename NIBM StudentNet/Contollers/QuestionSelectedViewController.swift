//
//  QuestionSelectedViewController.swift
//  NIBM StudentNet
//
//  Created by Tuhan Sapumanage on 8/6/19.
//  Copyright © 2019 Tuhan Sapumanage. All rights reserved.
//

import UIKit

class QuestionSelectedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{

    var answerList: [Answer] = []
    
    @IBOutlet weak var questionDesc: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var postedByLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var upvoteBtn: UIButton!
    @IBOutlet weak var votedCount: UIButton!
    @IBOutlet weak var downvoteBtn: UIButton!
    
    var questionSelected: Question!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = questionSelected.questionTitle
        self.questionDesc.text = questionSelected.questionDesc
        
        // Setting votes count
        if let votesCount = questionSelected.votesCount {
            self.votedCount.setTitle("\(votesCount)", for: .normal)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerTableViewCell", for: indexPath) as! AnswerTableViewCell
        return cell
    }
    

}
