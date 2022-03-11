//
//  ViewController.swift
//  ASRadioGroup
//
//  Created by amitpstu1@gmail.com on 07/12/2020.
//  Copyright (c) 2020 amitpstu1@gmail.com. All rights reserved.
//

import UIKit
import ASRadioGroup

class ViewController: UIViewController {
    @IBOutlet weak var asRadioGroup: ASRadioGroupClassic!
    @IBOutlet weak var asRadioGroup2: ASRadioGroupClassic!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        asRadioGroup
            .setDelegate(self)
            .setWidthToFit(true)
            .setRadioButtons([ASRadioButtonClassic(""),ASRadioButtonClassic("")], .horizontal)
            .removeTitle()
            .setTitle("")
            .setFont(UIFont(name: "Arial", size: 15))
            .setBordeColor(.clear)
            .setRadioPadding(0)
            .setImageColor(.gray, .gray)
            .setDotBackColor(.white, .white)
            .setDotColor(.clear, .clear)
            .setEnable(false)
            .setTextColor(.green)
            
        
        asRadioGroup2
            .setDelegate(self)
            .setWidthToFit(false)
            .setRadioButtons([ASRadioButtonClassic(""),ASRadioButtonClassic("")], .horizontal)
            .removeTitle()
            .setTitle("")
            .setFont(UIFont(name: "Arial", size: 15))
            .setBordeColor(.clear)
            .setRadioPadding(0)
            .setImageColor(.gray, .gray)
            .setDotBackColor(.white, .white)
            .setDotColor(.clear, .clear)
            .setEnable(false)
            .setTextColor(.green)
            
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ["Agree", "Not agree"].enumerated().forEach({ (index, item) in
            asRadioGroup.getButtons()?[index].setText(item)
        })
        
        ["Agree 1", "Not agree 1"].enumerated().forEach({ (index, item) in
            asRadioGroup2.getButtons()?[index].setText(item)
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController: ASRadioGroupDelegate {
    func radioButtonEvent(_ radioGroup: ASRadioGroup, _ button: ASRadioButton, _ isEnable: Bool) {
        print("index: \(button.index) isEnable: \(isEnable) asRadioGroup: \(asRadioGroup.isEnable)")
        if !isEnable {
            radioGroup.setEnable(true).setDotColor(UIColor(hexString: "38B6FF"), .gray, button, true)
        }
    }
}
