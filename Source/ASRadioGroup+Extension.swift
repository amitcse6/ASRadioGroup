//
//  ASRadioGroup+Extension.swift
//  ASRadioGroup
//
//  Created by Amit on 12/7/20.
//

import Foundation


extension ASRadioGroup {
    public func setupConstraints() {
        container?.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 9.0, *) {
            container?.topAnchor.constraint(equalTo: topAnchor, constant: PADDING).isActive = true
            container?.leftAnchor.constraint(equalTo: leftAnchor, constant: PADDING).isActive = true
            container?.rightAnchor.constraint(equalTo: rightAnchor, constant: -PADDING).isActive = true
            container?.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -PADDING).isActive = true
            
            groupLabel?.translatesAutoresizingMaskIntoConstraints = false
            groupLabel?.topAnchor.constraint(equalTo: container.unsafelyUnwrapped.topAnchor, constant: PADDING).isActive = true
            groupLabel?.leftAnchor.constraint(equalTo: container.unsafelyUnwrapped.leftAnchor, constant: PADDING).isActive = true
            groupLabel?.rightAnchor.constraint(equalTo: container.unsafelyUnwrapped.rightAnchor, constant: -PADDING).isActive = true
            groupLabel?.heightAnchor.constraint(equalToConstant: 15).isActive = true
            
            buttonContainer?.translatesAutoresizingMaskIntoConstraints = false
            buttonContainer?.topAnchor.constraint(equalTo: groupLabel.unsafelyUnwrapped.bottomAnchor, constant: PADDING).isActive = true
            buttonContainer?.leftAnchor.constraint(equalTo: container.unsafelyUnwrapped.leftAnchor, constant: PADDING).isActive = true
            buttonContainer?.rightAnchor.constraint(equalTo: container.unsafelyUnwrapped.rightAnchor, constant: -PADDING).isActive = true
            buttonContainer?.bottomAnchor.constraint(equalTo: container.unsafelyUnwrapped.bottomAnchor, constant: -PADDING).isActive = true
            
            
            radioButtons?.forEach({ (asRadioButton) in
                let index = asRadioButton.index
                asRadioButton.translatesAutoresizingMaskIntoConstraints = false
                if case self.layoutAlignment = ASRadioGroupAlignment.horizontal {
                    asRadioButton.topAnchor.constraint(equalTo: buttonContainer.unsafelyUnwrapped.topAnchor).isActive = true
                    if index == 0 {
                        asRadioButton.leftAnchor.constraint(equalTo: buttonContainer.unsafelyUnwrapped.leftAnchor).isActive = true
                    }else {
                        asRadioButton.leftAnchor.constraint(equalTo: radioButtons.unsafelyUnwrapped[index-1].rightAnchor).isActive = true
                    }
                    if index == radioButtons.unsafelyUnwrapped.count - 1 {
                        asRadioButton.rightAnchor.constraint(equalTo: buttonContainer.unsafelyUnwrapped.rightAnchor).isActive = true
                    }
                    asRadioButton.bottomAnchor.constraint(equalTo: buttonContainer.unsafelyUnwrapped.bottomAnchor).isActive = true
                    asRadioButton.widthAnchor.constraint(equalTo: radioButtons.unsafelyUnwrapped[0].widthAnchor).isActive = true
                }else {
                    if index == 0 {
                        asRadioButton.topAnchor.constraint(equalTo: buttonContainer.unsafelyUnwrapped.topAnchor).isActive = true
                    }else {
                        asRadioButton.topAnchor.constraint(equalTo: radioButtons.unsafelyUnwrapped[index-1].bottomAnchor).isActive = true
                    }
                    asRadioButton.leftAnchor.constraint(equalTo: buttonContainer.unsafelyUnwrapped.leftAnchor).isActive = true
                    asRadioButton.rightAnchor.constraint(equalTo: buttonContainer.unsafelyUnwrapped.rightAnchor).isActive = true
                    if index == radioButtons.unsafelyUnwrapped.count - 1 {
                        asRadioButton.bottomAnchor.constraint(equalTo: buttonContainer.unsafelyUnwrapped.bottomAnchor).isActive = true
                    }
                    asRadioButton.heightAnchor.constraint(equalTo: radioButtons.unsafelyUnwrapped[0].heightAnchor).isActive = true
                }
            })
        } else {
            // Fallback on earlier versions
        }
    }
}
