//
//  TaskStopwatchViewController.swift
//  Rise_2.0
//
//  Created by Nguyen Duy on 2019-05-28.
//  Copyright © 2019 Ryan Joseph . All rights reserved.
//
import UIKit

class TaskStopwatchViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        startButton.isEnabled = true
    }
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    
    
    //@IBOutlet weak var startButton: UIButton!
    //@IBOutlet weak var timerLabel: UILabel!
    
    var timer = Timer()
    var isTimerRunning = false
    var counter = 0.0
    
    @IBAction func startDidTap(_ sender: Any) {
     
        if !isTimerRunning {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
            
            isTimerRunning = true
        }
    }
    
    
    @objc func runTimer(){
        counter += 1
        let flooredCounter = Int(floor(counter))
        
        let hour = flooredCounter / 3600
        var hourString = "\(hour)"
        if hour < 10 {
            hourString = "0\(hour)"
        }
        
        let minute = (flooredCounter % 3600) / 60
        
        let second = (flooredCounter % 3600) % 60
        
        var minuteString = "\(minute)"
        if minute < 10 {
            minuteString = "0\(minute)"
        }
        var secondString = "\(second)"
        if counter < 10{
            secondString = "0\(flooredCounter)"
        }
        
        timerLabel.text = "\(hourString) : \(minuteString) : \(secondString)"
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
