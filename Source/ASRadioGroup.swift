//
//  ASRadioView.swift
//  superapp
//
//  Created by Amit on 2/7/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation
import UIKit

public enum ASRadioGroupAlignment {
    case vertical
    case horizontal
}

@objc public protocol ASRadioGroupDelegate {
    func radioButtonEvent(_ radioGroup: ASRadioGroup, _ button: ASRadioButton, _ isEnable: Bool)
}

public protocol ASRadioSubGroupDelegate {
}

public class ASRadioGroup: UIView {
    public var delegate: ASRadioGroupDelegate?
    public var subViewDelegate: ASRadioSubGroupDelegate?
    public var container: UIView?
    public var groupLabel: UILabel?
    public var buttonContainer: UIView?
    public var layoutAlignment: ASRadioGroupAlignment?
    public var radioButtons: [ASRadioButton]?
    public var PADDING: CGFloat = 4
    public var titleHeight: CGFloat = 15
    public var BUTTON_SPACE: CGFloat = 4
    public var iscCornerRadius = false
    
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        if iscCornerRadius {
            let cornerRadius = (container?.bounds.size.height ?? 0 - PADDING*2) * 0.5
            container?.layer.cornerRadius = cornerRadius
        }
    }
    
    @discardableResult
    public func selectButton(_ index: Int) -> ASRadioGroup {
        radioButtons?.forEach({ (asRadioButton) in
            if asRadioButton.index == index {
                asRadioButton.select()
            }else {
                asRadioButton.deselect()
            }
        })
        return self
    }
    
    func loadButtons() {
        if let radioButtons = radioButtons {
            for (index, asRadioButton) in radioButtons.enumerated() {
                buttonContainer?.addSubview(asRadioButton)
                asRadioButton.index = index
                asRadioButton.deselect()
                asRadioButton.delegate = self
            }
        }
        selectButton(0)
    }
}

extension ASRadioGroup: ASRadioButtonDelegate {
    public func radioButtonEvent(_ button: ASRadioButton, _ isEnable: Bool) {
        if isEnable {
            selectButton(button.index)
        }
        delegate?.radioButtonEvent(self, button, isEnable)
    }
}

extension ASRadioGroup {
    @discardableResult
    public func removeTitle() -> ASRadioGroup {
        self.titleHeight = 0
        setupConstraints()
        return self
    }
    
    @discardableResult
    public func setDelegate(_ delegate: ASRadioGroupDelegate) -> ASRadioGroup {
        self.delegate = delegate
        return self
    }
    
    @discardableResult
    public func setImageColor(_ normal: UIColor, _ selected: UIColor) -> ASRadioGroup {
        if let radioButtons = radioButtons {
            for (_, asRadioButton) in radioButtons.enumerated() {
                asRadioButton.setImageColor(normal, selected)
            }
        }
        return self
    }
    
    @discardableResult
    public func setDotBackColor(_ normal: UIColor, _ selected: UIColor) -> ASRadioGroup {
        if let radioButtons = radioButtons {
            for (_, asRadioButton) in radioButtons.enumerated() {
                asRadioButton.setDotBackColor(normal, selected)
            }
        }
        return self
    }
    
    @discardableResult
    public func setDotColor(_ normal: UIColor, _ selected: UIColor) -> ASRadioGroup {
        if let radioButtons = radioButtons {
            for (_, asRadioButton) in radioButtons.enumerated() {
                asRadioButton.setDotColor(normal, selected)
            }
        }
        return self
    }
    
    @discardableResult
    public func setEnable(_ isEnable: Bool) -> ASRadioGroup {
        if let radioButtons = radioButtons {
            for (_, asRadioButton) in radioButtons.enumerated() {
                asRadioButton.setEnable(isEnable)
            }
        }
        return self
    }
    
    @discardableResult
    public func setRadioButtons(_ radioButtons: [ASRadioButton], _ layoutAlignment: ASRadioGroupAlignment) -> ASRadioGroup {
        self.radioButtons = radioButtons
        self.layoutAlignment = layoutAlignment
        loadButtons()
        setupConstraints()
        return self
    }
    
    @discardableResult
    public func setBordeColor(_ borderColor: UIColor) -> ASRadioGroup {
        container?.layer.borderColor = borderColor.cgColor
        return self
    }
    
    @discardableResult
    public func setBordeWidth(_ borderWidth: CGFloat) -> ASRadioGroup {
        container?.layer.borderWidth = borderWidth
        return self
    }
    
    @discardableResult
    public func setButton(_ button: ASRadioButton) -> ASRadioGroup {
        radioButtons?.append(button)
        return self
    }
    
    @discardableResult
    public func setTitle(_ text: String) -> ASRadioGroup {
        groupLabel?.text = text
        return self
    }
    
    @discardableResult
    public func setFont(_ font: UIFont?) -> ASRadioGroup {
        if let font = font {
            radioButtons?.forEach({ radioButton in
                radioButton.myLabel?.font = font
            })
        }
        return self
    }
    
    @discardableResult
    public func setRadioPadding(_ radioPadding: CGFloat?) -> ASRadioGroup {
        if let radioPadding = radioPadding {
            radioButtons?.forEach({ radioButton in
                radioButton.RADIO_PADDING = radioPadding
                radioButton.setupConstraints()
            })
        }
        return self
    }
    
    public func getButtons() -> [ASRadioButton]? {
        return radioButtons
    }
}
