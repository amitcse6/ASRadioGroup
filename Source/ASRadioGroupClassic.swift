//
//  ASRadioGroupStyleClassic.swift
//  superapp
//
//  Created by Amit on 2/7/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation
import UIKit

public class ASRadioGroupClassic: ASRadioGroup, ASRadioSubGroupDelegate {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    public init() {
        super.init(frame: CGRect.zero)
        setup()
    }
    
    public init(_ delegate: ASRadioGroupDelegate, _ radioButtons: [ASRadioButton], _ layoutAlignment: ASRadioGroupAlignment) {
        super.init(frame: CGRect.zero)
        self.delegate = delegate
        self.layoutAlignment = layoutAlignment
        self.radioButtons = radioButtons
        setup()
    }
    
    public func setup() {
        subViewDelegate = self
        setupUIElements()
        setupConstraints()
    }
    
    public func setupUIElements() {
        container = UIView()
        addSubview(container.unsafelyUnwrapped)
        container?.backgroundColor = .clear
        container?.layer.rasterizationScale = UIScreen.main.scale
        container?.layer.shouldRasterize = true
        setBordeColor(UIColor(red: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 1.0))
        setBordeWidth(1.0)
        
        groupLabel = UILabel()
        container?.addSubview(groupLabel.unsafelyUnwrapped)
        groupLabel?.backgroundColor = .clear
        groupLabel?.textColor = UIColor.black
        groupLabel?.textAlignment = .left
        groupLabel?.text = "Radio Group"
        
        buttonContainer = UIView()
        container?.addSubview(buttonContainer.unsafelyUnwrapped)
        buttonContainer?.backgroundColor = .clear
        
        loadButtons()
    }
}
