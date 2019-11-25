//
//  TaskButton.swift
//  Rise_2.0
//
//  Created by Ryan Joseph  on 6/17/19.
//  Copyright © 2019 Ryan Joseph . All rights reserved.
//

import UIKit

class TaskButton2: UIButton {
    
    var isOn = false
    var name = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        disableButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        disableButton()
    }
    
    func initButton() {
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.blue.cgColor
        layer.cornerRadius = frame.size.height/2
        
        setTitleColor(UIColor.blue, for: .normal)
        let defaults = UserDefaults.standard
        activateButton(bool: defaults.bool(forKey: self.name))
        addTarget(self, action: #selector(TaskButton.buttonPressed), for: .touchUpInside)
    }
    func disableButton() {
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.gray.cgColor
        layer.cornerRadius = frame.size.height/2
        self.isEnabled = false
        
        setTitle(self.name, for: .normal)
        setTitleColor(UIColor.white, for: .normal)
        backgroundColor = UIColor.gray
        let defaults = UserDefaults.standard
        if(defaults.bool(forKey: "Enable")){
            initButton()
        }
        
    }
    @objc func buttonPressed() {
        let defaults = UserDefaults.standard
        let bool = defaults.bool(forKey: self.name)
        if(!bool){
            activateButton(bool: !isOn)
        }
    }
    
    func activateButton(bool: Bool) {
        let defaults = UserDefaults.standard
        defaults.set(bool, forKey: self.name)
        
        let color = bool ? UIColor.blue : .clear
        let title = bool ? "Completed" : self.name
        let titleColor = bool ? .white : UIColor.blue
        self.isEnabled = bool ? false : true
        
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        backgroundColor = color
    }
    
}
