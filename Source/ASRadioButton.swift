//
//  ASRadioButton.swift
//  superapp
//
//  Created by Amit on 2/7/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation

public protocol ASRadioButtonSubViewDelegate {
}

public protocol ASRadioButtonDelegate {
    func radioButtonEvent(_ button: ASRadioButton)
}

public class ASRadioButton: UIView {
    public var delegate: ASRadioButtonDelegate?
    public var subViewDelegate: ASRadioButtonSubViewDelegate?
    public var index: Int = 0
    public var buttonTitle: String?
    public var container: UIView?
    public var myLabel: UILabel?
    public var myButton: UIImageView?
    public var PADDING: CGFloat = 4
    public var INNER_PADDING: CGFloat = 4
    public var iscCornerRadius = true
    public var isSelected = false
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        if iscCornerRadius {
            let cornerRadius = (container?.bounds.size.height ?? 0 - PADDING*2) * 0.5
            container?.layer.cornerRadius = cornerRadius
            myButton?.layer.cornerRadius = cornerRadius
        }
    }
    
    @objc func radioButtonEvent(_ sender: ASRadioButtonGestureRecognizer) {
        delegate?.radioButtonEvent(self)
    }
    
    func select() {
        isSelected = true
        hilightSelectedButton()
    }
    
    func deselect() {
        isSelected = false
        hilightSelectedButton()
    }
    
    private func hilightSelectedButton() {
        myButton?.backgroundColor = isSelected ? .red : .gray
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
