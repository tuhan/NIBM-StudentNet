//
//  QuestionTableViewCell.swift
//  NIBM StudentNet
//
//  Created by Tuhan Sapumanage on 8/5/19.
//  Copyright © 2019 Tuhan Sapumanage. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class QuestionTableViewCell: UITableViewCell {

    @IBOutlet weak var questionTitle: UILabel!
    @IBOutlet weak var questionDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
