//
//  ToDoController.swift
//  Rise_2.0
//
//  Created by Ryan Joseph  on 6/17/19.
//  Copyright © 2019 Ryan Joseph . All rights reserved.
//

import UIKit
import Firebase

class ToDoController: NSObject {

    var ref: DatabaseReference!
    
    
    
    
    
    static var todosArray:Array<String> = []
    
    
    
    class func addToDo( newToDo:String ) {
        ToDoController.todosArray.append( newToDo)
        
        
    }
    
    class func removeToDo( atIndex:Int) {
        
        ToDoController.todosArray.remove(at: atIndex)
        
    }
    
    
    
    
    
    
}
