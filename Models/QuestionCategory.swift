//
//  QuestionCategory.swift
//  NIBM StudentNet
//
//  Created by Tuhan Sapumanage on 8/5/19.
//  Copyright © 2019 Tuhan Sapumanage. All rights reserved.
//

import Foundation

class QuestionCategory {
    var questionCategory: String!
    var questionCount: Int8!

    init (questionCategory: String, questionCount: Int8) {
        self.questionCategory = questionCategory
        self.questionCount = questionCount
    }
}
