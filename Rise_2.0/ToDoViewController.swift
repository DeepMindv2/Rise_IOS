//
//  ToDoViewController.swift
//  Rise_2.0
//
//  Created by Ryan Joseph  on 6/17/19.
//  Copyright © 2019 Ryan Joseph . All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ToDoViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var ref: DatabaseReference!;
    var user: DatabaseQuery!
    //var user:""

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveToDo(_ sender: Any) {

        ToDoController.addToDo(newToDo: textField.text!)
        
        //user = ref.child("Users").queryOrderedByKey().queryLimited(toLast: 1)
        //var myString = String(user)
        //self.ref.child("Users" + myString).childByAutoId().child("Engagement:").setValue(textField.text!)
        //self.ref.child("Users").childByAutoId().child("User").setValue(UsernameText.text)

        
//        dismiss(animated: true, completion: nil)
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
