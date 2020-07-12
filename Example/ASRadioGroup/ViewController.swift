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
            .setRadioButtons([ASRadioButtonClassic("Mobile"), ASRadioButtonClassic("Email")], .horizontal)
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
