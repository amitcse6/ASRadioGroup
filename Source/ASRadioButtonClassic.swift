//
//  ASRadioButtonClassic.swift
//  superapp
//
//  Created by Amit on 2/7/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation

public class ASRadioButtonClassic: ASRadioButton, ASRadioButtonSubViewDelegate  {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    public init(_ buttonTitle: String?) {
        super.init(frame: CGRect.zero)
        self.buttonTitle = buttonTitle
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
        //setBordeColor(UIColor(red: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 1.0))
        //setBordeWidth(1.0)
        
        myLabel = UILabel()
        container?.addSubview(myLabel.unsafelyUnwrapped)
        myLabel?.backgroundColor = .clear
        myLabel?.textColor = .black
        myLabel?.textAlignment = .left
        myLabel?.text = buttonTitle ?? ""

        myButton = UIImageView()
        container?.addSubview(myButton.unsafelyUnwrapped)
        myButton?.layer.rasterizationScale = UIScreen.main.scale
        myButton?.layer.shouldRasterize = true
        myButton?.contentMode = .scaleAspectFill
 
        self.isUserInteractionEnabled = true
        let tapGestureRecognizer = ASRadioButtonGestureRecognizer(target: self, action: #selector(radioButtonEvent(_:))) 
        tapGestureRecognizer.firstObject = nil
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    public func setupConstraints() {
        super.setupConstraintsWithButtonLeft()
    }
}
