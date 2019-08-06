//
//  Answer.swift
//  NIBM StudentNet
//
//  Created by Tuhan Sapumanage on 8/6/19.
//  Copyright © 2019 Tuhan Sapumanage. All rights reserved.
//

import Foundation

class Answer {
    
    var answerID: String!
    var answerDate: String!
    var answerTime: String!
    var answerDescription: String!
    
    init (answerID: String, answerDate: String, answerTime: String, answerDescription: String) {
        self.answerID = answerID
        self.answerDate = answerDate
        self.answerTime = answerTime
        self.answerDescription = answerDescription
    }
    
}
