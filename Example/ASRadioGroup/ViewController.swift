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
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        asRadioGroup
            .setDelegate(self)
            .setRadioButtons([ASRadioButtonClassic("Agree"),ASRadioButtonClassic("Not agree")], .horizontal)
            .removeTitle()
            .setTitle("")
            .setFont(UIFont(name: "Arial", size: 15))
            .setBordeColor(.clear)
            .setRadioPadding(0)
            .setImageColor(.gray, .gray)
            .setDotBackColor(.white, .white)
            .setDotColor(UIColor(hexString: "38B6FF"), .gray)
            .selectButton(1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: ASRadioGroupDelegate {
    func radioButtonEvent(_ radioGroup: ASRadioGroup, _ button: ASRadioButton) {
        print("index: \(button.index)")
    }
}
