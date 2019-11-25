//
//  Calibrate_OR_PracticeViewController.swift
//  Rise_2.0
//
//  Created by Ryan Joseph  on 6/10/19.
//  Copyright © 2019 Ryan Joseph . All rights reserved.
//

import UIKit

class Calibrate_OR_PracticeViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        relax_button.name = "Relax"
        relax_button.initButton()
        task1_button.name = "Task #1"
        task1_button.disableButton() 
        task2_button.name = "Task #2"
        task2_button.disableButton()
        task3_button.name = "Task #3"
        task3_button.disableButton()
        // here we obtain the last state of the button
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var task1_button: TaskButton2!
    
    @IBOutlet weak var task2_button: TaskButton2!
    
    @IBOutlet weak var task3_button: TaskButton2!
    
    @IBOutlet weak var relax_button: TaskButton2!
    
    @IBAction func relaxIsPressed(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(true, forKey: "Enable")
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
