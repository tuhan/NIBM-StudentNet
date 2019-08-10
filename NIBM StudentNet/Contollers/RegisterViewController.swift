//
//  RegisterViewController.swift
//  NIBM StudentNet
//
//  Created by Tuhan Sapumanage on 8/5/19.
//  Copyright © 2019 Tuhan Sapumanage. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    // TODO:
    // Take the incoming values (First Name, Last Name, DOB, Batch) and assign it to the Student Class (in Models/Student)
    // Push those data to Firebase with using student email as index
    // Make sure to display an altert if the mail does not end with "@nibm.lk"
    // If its a valid mail then create new user and take them to home page
    @IBOutlet weak var fNameTxt: UITextField!
    @IBOutlet weak var lNameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var dobPicker: UIDatePicker!
    @IBOutlet weak var batchPicker: UIPickerView!
    @IBOutlet weak var loadingDataView: UIView!
    
    var ref: DatabaseReference!
    var courses: [Courses] = [] {
        didSet{
            batchPicker.reloadAllComponents()
            self.hideGettingDataView()
        }
    }
    var otp : String!
    var registerData:[Student] = [] {
        didSet{
            self.performSegue(withIdentifier: "otp", sender: nil)
        }
    }
    var emailValid: Bool = false
    var errorSubmition: String = ""
    var submitStatus: Bool = false
    var lName: String!
    var fName: String!
    var email: String!
    var dobDate: String!
    var batchName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dbConfig()
        self.viewGettingDataView()
        self.getCourses()
        self.objectConfig()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "otp" {
            let studentData = self.registerData[0]
            let destinationVC = segue.destination as! ConfirmEmailViewController
            destinationVC.studentInfo = studentData
            destinationVC.otp = String(Int.random(in: 1000 ... 9999))
        }
    }
    
    func objectConfig(){
        self.batchPicker.delegate = self
        self.batchPicker.dataSource = self
    }
    
    func dbConfig(){
        ref = Database.database().reference()
    }
    
    func viewGettingDataView(){
        self.loadingDataView.isHidden = false
    }
    
    func hideGettingDataView(){
        self.loadingDataView.isHidden = true
    }
    
    func getCourses(){
        self.ref.child("batch").observeSingleEvent(of: .value, with: { (Snapshot) in
            var newCourses: [Courses] = []
            print(Snapshot.children)
            
            if Snapshot.childrenCount > 0 {
                
                for cours in Snapshot.children.allObjects as! [DataSnapshot] {
                    
                    let coursesObject = cours.value as? [String: AnyObject]
                    let courseData = Courses(name: coursesObject!["name"] as! String)
                    newCourses.append(courseData)
                }
            }
            self.courses = newCourses
            
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func dataFormat(dobDate: Date)-> String{
        let formatter = DateFormatter()
        //        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let myString = formatter.string(from: dobDate)
        let yourDate = formatter.date(from: myString)
        formatter.dateFormat = "dd-MMM-yyyy"
        let dob = formatter.string(from: yourDate!)
        
        return dob
    }
    
    func isValidateEmail(emailNow: String!)-> Bool{
        
        self.emailTxt.layer.cornerRadius = 5
        self.emailTxt.layer.borderWidth = 2
        if emailNow!.contains("@nibm.lk") {
            print("exists")
            self.emailTxt.layer.borderColor = UIColor(named: "done")?.cgColor
            return true
        }
        
            self.emailTxt.layer.borderColor = UIColor(named: "error")?.cgColor
            return false
        
    }
    

    @IBAction func didEditingChangedEmail(_ sender: Any) {
        let email = self.emailTxt.text
        self.emailValid = isValidateEmail(emailNow: email)
        print(emailValid)
        
    }
    
 
    @IBAction func didClickRegisterNow(_ sender: Any) {
        
        self.fName = self.fNameTxt.text
        self.lName = self.lNameTxt.text
        self.email = self.emailTxt.text
        self.dobDate = dataFormat(dobDate: self.dobPicker.date)
        self.batchName = self.courses[batchPicker.selectedRow(inComponent: 0)].name
        
        let studentDataGet = Student(studentEmail: self.email, studentFirstName: self.fName, studentLastName: self.lName, studentMobile: "", studentLevel: "", studentBatch: self.batchName)
        
        
        self.registerData.append(studentDataGet)
        
    }
    
}

extension RegisterViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return courses.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return courses[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    
    
}
