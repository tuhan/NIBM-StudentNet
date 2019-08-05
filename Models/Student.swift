//
//  Student.swift
//  NIBM StudentNet
//
//  Created by Tuhan Sapumanage on 8/5/19.
//  Copyright © 2019 Tuhan Sapumanage. All rights reserved.
//

import Foundation

class Student {
    var studentEmail: String!
    var studentFirstName: String!
    var studentLastName: String!
    var studentMobile: String!
    var studentBatch: String! // BSc (Hons) Computing 17.1, BSc (Hons) ITB 17.1,
    
    init (studentEmail: String, studentFirstName: String, studentLastName: String, studentMobile: String, studentLevel: String, studentBatch: String) {
        
        self.studentEmail = studentEmail
        self.studentFirstName = studentFirstName
        self.studentLastName = studentLastName
        self.studentMobile = studentMobile
        self.studentBatch = studentBatch
    }
    
}


