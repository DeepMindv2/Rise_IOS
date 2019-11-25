//
//  GraphViewController.swift
//  Rise_2.0
//
//  Created by Ryan Joseph  on 1/5/19.
//  Copyright © 2019 Ryan Joseph . All rights reserved.
//

import UIKit
import SwiftCharts
import FirebaseDatabase



class GraphViewController: UIViewController {
    
    
    
    var chartView: BarsChart!
    var ref: DatabaseReference?
    var postData = [Double]()
    //var postData: [Double]! = []
    var DatabaseHandle: DatabaseHandle?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting the Firebase Reference
        ref = Database.database().reference()
        
//        // Retrieve the Posts and Listen for Changes
//        DatabaseHandle = ref?.child("Users/-Engagement_Temp").observe(.childAdded, with: { (snapshot) in
//
//            // Code to execute when a child is added under Posts
//            // Take the Value from the Snapshot and add it to postData array
//
//            // Try to convert value of Data to a String
//            let post = snapshot.value as? Int
//
//            if let actualPost = post {
//
//                // Append the Data to our Post Data Array
//                self.postData.append(Double(actualPost))
//
//                // Reload the Table view
//                //self.UITableView.reloadData()
//
//            }
//
//
//        })
        //pulls the value that was stored in '-Engagement Temp' in Firebase
        ref?.child("Users/-Engagement_Temp").observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let engagement = value?["temp"] as? Double
            print("Current engagement: \(String(describing: engagement))")
            //self.postData.append(engagement!)
            
        
        let chartConfig = BarsChartConfig(
            valsAxisConfig: ChartAxisConfig(from: 0, to: 110, by:10)
        
        )
        
        //let frame = CGRect(x: 0, y: 70, width: self.view.frame.width, height: 500)
        let frame = CGRect(x: 10, y: 200, width: 320, height: 560)
        
        let chart = BarsChart(
            frame: frame,
            chartConfig: chartConfig,
            xTitle: "",
            yTitle: "Engagment Score",
            bars: [
                ("Current Task", engagement!)

            ],
            color: UIColor.red,
            barWidth: 35
        )
        
        self.view.addSubview(chart.view)
        self.chartView = chart 
        
        // Do any additional setup after loading the view.
    
    })
    
    
}
    
}
    

