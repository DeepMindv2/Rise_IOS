//
//  SetTaskViewController.swift
//  Rise_2.0
//
//  Created by Nguyen Duy on 2019-05-28.
//  Copyright © 2019 Ryan Joseph . All rights reserved.
//

import UIKit
import FirebaseDatabase

class SetTaskViewController: UIViewController, UITextFieldDelegate {
    
    
    var ref: DatabaseReference!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()


        nameTask.delegate = self
        let defaults = UserDefaults.standard
        if let name = defaults.string(forKey: "Enter your Task"){
            taskName.text = name
        }
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var nameTask: UITextField!
    @IBOutlet weak var taskName: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    @IBAction func saveTask(_ sender: Any) {
        if (nameTask.text?.count)! > 0{
            let defaults = UserDefaults.standard.set(nameTask.text!, forKey: "Enter your Task")
        }
        //self.performSegue(withIdentifier: "graphSegue", sender: self)
    }
    
    @IBAction func SaveButtonPressed(_ sender: UIButton) {
        
        
        
//        self.ref.child("Users").child("Name").child("Users Tasks").setValue(nameTask.text)

    }
    
    
    
}
