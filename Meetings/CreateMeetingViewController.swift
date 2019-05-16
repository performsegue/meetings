//
//  CreateMeetingViewController.swift
//  Meetings
//
//  Created by Bharath  Raj kumar on 10/02/19.
//  Copyright © 2019 Bharath Raj Kumar. All rights reserved.
//

import UIKit
import FirebaseFirestore

class CreateMeetingViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var startTimeTextField: UITextField!
    @IBOutlet weak var endTimeTextField: UITextField!
    @IBOutlet weak var scheduleMeetingButton: UIButton! 
    
    
    lazy var database = Firestore.firestore()
    lazy var MeetingsReference = database.collection("meetings")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.scheduleMeetingButton.layer.cornerRadius = 4
        self.scheduleMeetingButton.layer.masksToBounds = true
        
        let leftView1 = UIView()
        leftView1.frame = CGRect(x: 0, y: 0, width: 20, height: 30)
        let leftView2 = UIView()
        leftView2.frame = CGRect(x: 0, y: 0, width: 20, height: 30)
        let leftView3 = UIView()
        leftView3.frame = CGRect(x: 0, y: 0, width: 20, height: 30)
        let leftView4 = UIView()
        leftView4.frame = CGRect(x: 0, y: 0, width: 20, height: 30)
        
        titleTextField.leftView = leftView1
        titleTextField.leftViewMode = .always
        
        addressTextField.leftView = leftView2
        addressTextField.leftViewMode = .always
        
        startTimeTextField.leftView = leftView3
        startTimeTextField.leftViewMode = .always
        
        endTimeTextField.leftView = leftView4
        endTimeTextField.leftViewMode = .always
    }
    
    
    func createMeetings()
    {
        MeetingsReference.addDocument(data: ["title":"\(titleTextField.text ?? "")" ,"address":"\(addressTextField.text ?? "")","startTime":"\(startTimeTextField.text ?? "")" ,"endTime":"\(endTimeTextField.text ?? "")"])
        { [weak self]
            error in
            
            print(error ?? "No error")
            
            self?.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func scheduleMeetingAction(_ sender: UIButton)
    {
       self.createMeetings()
    }


}

extension CreateMeetingViewController: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case titleTextField:
            self.titleTextField.resignFirstResponder()
            self.addressTextField.becomeFirstResponder()
        case addressTextField:
            self.addressTextField.resignFirstResponder()
            self.startTimeTextField.becomeFirstResponder()
        case startTimeTextField:
            self.startTimeTextField.resignFirstResponder()
            self.endTimeTextField.becomeFirstResponder()
        case endTimeTextField:
            self.endTimeTextField.resignFirstResponder()
        default:
            break
        }
         return true
    }
}
