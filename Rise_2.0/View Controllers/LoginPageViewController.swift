//
//  LoginPageViewController.swift
//  Rise_2.0
//
//  Created by Ryan Joseph  on 1/5/19.
//  Copyright © 2019 Ryan Joseph . All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class LoginPageViewController: UIViewController {
    
    @IBOutlet weak var UsernameText: UITextField!
    
    
    
    var ref: DatabaseReference!
    //var items: [GroceryItem] = []
    //let ref = Database.database().reference(withPath: "Users")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()
        
       // ref.queryOrdered(byChild: "Names").observe(.value, with: { snapshot in
         //   var newItems: [GroceryItem] = []
        //    for child in snapshot.children {
        //        if let snapshot = child as? DataSnapshot,
         //           let groceryItem = GroceryItem(snapshot: snapshot) {
         //           newItems.append(groceryItem)
              //  }
            //}
        
        
       // self.items = newItems

    }


    
    @IBAction func LoginButtonHit(_ sender: Any) {
        
        //Adds new user to the Firebase Database
        self.ref.child("Users").childByAutoId().child("--User").setValue(UsernameText.text);
        
        
        
        
    }
    
    
    
    
}
