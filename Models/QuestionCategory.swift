//
//  QuestionCategory.swift
//  NIBM StudentNet
//
//  Created by Tuhan Sapumanage on 8/5/19.
//  Copyright © 2019 Tuhan Sapumanage. All rights reserved.
//

import Foundation

class QuestionCategory {
    var questionCategoryID: String!
    var questionCategoryName: String!
    var questionCount: Int8!

    init (questionCategoryID: String, questionCategoryName: String, questionCount: Int8) {
        self.questionCategoryID = questionCategoryID
        self.questionCategoryName = questionCategoryName
        self.questionCount = questionCount
    }
}
