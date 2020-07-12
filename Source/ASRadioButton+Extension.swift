//
//  ASRadioButton+Extension.swift
//  superapp
//
//  Created by Amit on 8/7/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation

extension ASRadioButton {
    
    public func setupConstraintsWithButtonLeft() {
        container?.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 9.0, *) {
            container?.topAnchor.constraint(equalTo: topAnchor, constant: PADDING).isActive = true
            container?.leftAnchor.constraint(equalTo: leftAnchor, constant: PADDING).isActive = true
            container?.rightAnchor.constraint(equalTo: rightAnchor, constant: -PADDING).isActive = true
            container?.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -PADDING).isActive = true
            
            myButton?.translatesAutoresizingMaskIntoConstraints = false
            myButton?.topAnchor.constraint(equalTo: container.unsafelyUnwrapped.topAnchor).isActive = true
            myButton?.leftAnchor.constraint(equalTo: container.unsafelyUnwrapped.leftAnchor).isActive = true
            myButton?.bottomAnchor.constraint(equalTo: container.unsafelyUnwrapped.bottomAnchor).isActive = true
            myButton?.widthAnchor.constraint(equalTo: myButton.unsafelyUnwrapped.heightAnchor).isActive = true
            
            myLabel?.translatesAutoresizingMaskIntoConstraints = false
            myLabel?.topAnchor.constraint(equalTo: container.unsafelyUnwrapped.topAnchor).isActive = true
            myLabel?.leftAnchor.constraint(equalTo: myButton.unsafelyUnwrapped.rightAnchor, constant: 16).isActive = true
            myLabel?.rightAnchor.constraint(equalTo: container.unsafelyUnwrapped.rightAnchor).isActive = true
            myLabel?.bottomAnchor.constraint(equalTo: container.unsafelyUnwrapped.bottomAnchor).isActive = true
        } else {
            // Fallback on earlier versions
        }
    }
    
    public func setupConstraintsWithButtonRight() {
        container?.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 9.0, *) {
            container?.topAnchor.constraint(equalTo: topAnchor, constant: PADDING).isActive = true
            container?.leftAnchor.constraint(equalTo: leftAnchor, constant: PADDING).isActive = true
            container?.rightAnchor.constraint(equalTo: rightAnchor, constant: -PADDING).isActive = true
            container?.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -PADDING).isActive = true
            
            myLabel?.translatesAutoresizingMaskIntoConstraints = false
            myLabel?.topAnchor.constraint(equalTo: container.unsafelyUnwrapped.topAnchor).isActive = true
            myLabel?.leftAnchor.constraint(equalTo: container.unsafelyUnwrapped.leftAnchor).isActive = true
            myLabel?.bottomAnchor.constraint(equalTo: container.unsafelyUnwrapped.bottomAnchor).isActive = true
            
            myButton?.translatesAutoresizingMaskIntoConstraints = false
            myButton?.topAnchor.constraint(equalTo: container.unsafelyUnwrapped.topAnchor).isActive = true
            myButton?.leftAnchor.constraint(equalTo: myLabel.unsafelyUnwrapped.rightAnchor).isActive = true
            myButton?.rightAnchor.constraint(equalTo: container.unsafelyUnwrapped.rightAnchor).isActive = true
            myButton?.bottomAnchor.constraint(equalTo: container.unsafelyUnwrapped.bottomAnchor).isActive = true
            myButton?.widthAnchor.constraint(equalTo: myButton.unsafelyUnwrapped.heightAnchor).isActive = true
        } else {
            // Fallback on earlier versions
        }
    }
}
