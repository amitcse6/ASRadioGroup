//
//  ASRadioButton.swift
//  superapp
//
//  Created by Amit on 2/7/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation
import UIKit

public protocol ASRadioButtonSubViewDelegate: AnyObject {
}

public protocol ASRadioButtonDelegate: AnyObject {
    func radioButtonEvent(_ button: ASRadioButton, _ isEnable: Bool)
}

public class ASRadioButton: UIView {
    public weak var delegate: ASRadioButtonDelegate?
    public weak var subViewDelegate: ASRadioButtonSubViewDelegate?
    public var index: Int = 0
    public var buttonTitle: String?
    public var container: UIView?
    public var myLabel: UILabel?
    public var myButton: ASRButton?
    public var PADDING: CGFloat = 4
    public var INNER_PADDING: CGFloat = 4
    public var buttonCenterPadding: CGFloat = 4
    public var RADIO_PADDING: CGFloat = 0
    public var iscCornerRadius = true
    public var isSelected = false
    public var isEnable = true
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        if iscCornerRadius {
            let cornerRadius = (container?.bounds.size.height ?? 0 - PADDING*2) * 0.5
            container?.layer.cornerRadius = cornerRadius
            myButton?.layer.cornerRadius = cornerRadius
            
        }
    }
    
    @objc func radioButtonEvent(_ sender: ASRadioButtonGestureRecognizer) {
        delegate?.radioButtonEvent(self, isEnable)
    }
    
    func select() {
        isSelected = true
        myButton?.select()
    }
    
    func deselect() {
        isSelected = false
        myButton?.deselect()
    }
}

extension ASRadioButton {
    @discardableResult
    public func setBordeColor(_ borderColor: UIColor) -> ASRadioButton {
        container?.layer.borderColor = borderColor.cgColor
        return self
    }
    
    @discardableResult
    public func setBordeWidth(_ borderWidth: CGFloat) -> ASRadioButton {
        container?.layer.borderWidth = borderWidth
        return self
    }
    
    @discardableResult
    public func setRadioPadding(_ radioPadding: CGFloat) -> ASRadioButton {
        RADIO_PADDING = radioPadding
        setupConstraints()
        return self
    }
    
    @discardableResult
    public func setImageColor(_ normal: UIColor, _ selected: UIColor) -> ASRadioButton {
        myButton?.setImageColor(normal, selected)
        return self
    }
    
    @discardableResult
    public func setDotBackColor(_ normal: UIColor, _ selected: UIColor) -> ASRadioButton {
        myButton?.setDotBackColor(normal, selected)
        return self
    }
    
    @discardableResult
    public func setDotColor(_ normal: UIColor, _ selected: UIColor, _ isSelected: Bool? = nil) -> ASRadioButton {
        myButton?.setDotColor(normal, selected, isSelected ?? false)
        return self
    }
    
    @discardableResult
    public func setEnable(_ isEnable: Bool) -> ASRadioButton {
        self.isEnable = isEnable
        return self
    }
    
    @discardableResult
    public func setText(_ text: String?) -> ASRadioButton {
        if let text = text {
            myLabel?.text = text
        }
        return self
    }
    
    @discardableResult
    public func setTextColor(_ color: UIColor?) -> ASRadioButton {
        if let color = color {
            myLabel?.textColor = color
        }
        return self
    }
}

public class ASRadioButtonGestureRecognizer: UITapGestureRecognizer {
    var firstObject: Any?
    
    public func setFirstObject(_ sender: Any?) {
        self.firstObject = sender
    }
    
    public func getFirstObject() -> Any? {
        return self.firstObject
    }
}
