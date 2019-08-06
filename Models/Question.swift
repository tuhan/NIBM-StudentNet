//
//  Question.swift
//  NIBM StudentNet
//
//  Created by Tuhan Sapumanage on 8/6/19.
//  Copyright © 2019 Tuhan Sapumanage. All rights reserved.
//

import Foundation

class Question {
    
    var questionID: String!
    var questionTitle: String!
    var questionDesc: String!
    var questionPostedBy: String!
    var questionStatus: String!
    var questionAnswerCount: Int!
    var questionDate: String!
    var questionTime: String!
    var votesCount: Int!
    var answers: [Answer]?
    
    init (questionID: String, questionTitle: String, questionDesc: String, questionPostedBy: String, questionStatus: String, questionAnswerCount: Int, questionDate: String, questionTime: String, votesCount: Int) {
        self.questionID = questionID
        self.questionTitle = questionTitle
        self.questionDesc = questionDesc
        self.questionPostedBy = questionPostedBy
        self.questionStatus = questionStatus
        self.questionAnswerCount = questionAnswerCount
        self.questionDate = questionDate
        self.questionTime = questionTime
        self.votesCount = votesCount
    }
    
}
