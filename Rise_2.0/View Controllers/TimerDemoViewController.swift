//
//  TimerDemoViewController.swift
//  Rise_2.0
//
//  Created by Nguyen Duy on 2019-05-22.
//  Copyright © 2019 Ryan Joseph . All rights reserved.
//

import UIKit

class TimerDemoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        resetButton.isEnabled = false
        pauseButton.isEnabled = false
        startButton.isEnabled = true
        nextButton.isEnabled = false
        timerLabel.text = "\(Int(counter))"
    }
    
    var timer = Timer()
    var isTimerRunning = false
    var counter = 60.0
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!

    @IBAction func resetTap(_ sender: Any) {
        timer.invalidate()
        isTimerRunning = false
        counter = 60.0
        let flooredCounter = Int(floor(counter))
        timerLabel.text = "\(flooredCounter)"
        resetButton.isEnabled = false
        startButton.isEnabled = true
        pauseButton.isEnabled = false
    }
    
    
    @IBAction func pauseTap(_ sender: Any) {
        
        resetButton.isEnabled = true
        pauseButton.isEnabled = false
        startButton.isEnabled = true
        isTimerRunning = false
        timer.invalidate();
    }
    
    
    @IBAction func startTap(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
        pauseButton.isEnabled = true
    }
    
    @objc func runTimer(){
        counter -= 1
        let flooredCounter = Int(floor(counter))
        
        var secondString = "\(flooredCounter)"
        
        if counter < 10{
            secondString = "0\(flooredCounter)"
        }
        
        timerLabel.text = "\(secondString)"
        if(counter == 0){
            timer.invalidate()
            resetButton.isEnabled = true
            pauseButton.isEnabled = false
            nextButton.isEnabled = true
        }
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
