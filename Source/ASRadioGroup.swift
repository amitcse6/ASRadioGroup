//
//  ASRadioView.swift
//  superapp
//
//  Created by Amit on 2/7/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation

public enum ASRadioGroupAlignment {
    case vertical
    case horizontal
}

public protocol ASRadioGroupDelegate {
    func radioButtonEvent(_ radioGroup: ASRadioGroup, _ button: ASRadioButton)
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
    public var BUTTON_SPACE: CGFloat = 4
    public var iscCornerRadius = false
    
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        if iscCornerRadius {
            let cornerRadius = (container?.bounds.size.height ?? 0 - PADDING*2) * 0.5
            container?.layer.cornerRadius = cornerRadius
        }
    }
    
    func selectButton(_ index: Int) {
        radioButtons?.forEach({ (asRadioButton) in
            if asRadioButton.index == index {
                asRadioButton.select()
            }else {
                asRadioButton.deselect()
            }
        })
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
    public func radioButtonEvent(_ button: ASRadioButton) {
        selectButton(button.index)
        delegate?.radioButtonEvent(self, button)
    }
}

extension ASRadioGroup {
    @discardableResult
    public func setDelegate(_ delegate: ASRadioGroupDelegate) -> ASRadioGroup {
        self.delegate = delegate
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
    
    public func getButtons() -> [ASRadioButton]? {
        return radioButtons
    }
}
