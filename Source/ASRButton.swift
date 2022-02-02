//
//  ASRButton.swift
//  ASRadioGroup
//
//  Created by Amit on 14/7/20.
//

import Foundation
import UIKit

public class ASRButton: UIView {
    public var imageView: UIImageView?
    public var dotBackContainer: ASRInnerButton?
    public var dotContainer: ASRInnerButton?
    public var BACPADDING: CGFloat = 1
    public var PADDING: CGFloat = 5
    public var isCornerRadius = true
    public var imageBackColor: UIColor = .gray
    public var dotBackColor: UIColor = .white
    public var imageBackColorSelected: UIColor = .gray
    public var dotBackColorSelected: UIColor = .white
    
    
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
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        if isCornerRadius {
            let cornerRadius = (imageView?.bounds.size.height ?? 0) * 0.5
            imageView?.layer.cornerRadius = cornerRadius
            dotBackContainer?.layer.cornerRadius = cornerRadius
            dotContainer?.layer.cornerRadius = cornerRadius
            
        }
    }
    
    public func setup() {
        setupUIElements()
        setupConstraints()
    }
    
    public func setupUIElements() {
        imageView = UIImageView()
        addSubview(imageView.unsafelyUnwrapped)
        imageView?.layer.rasterizationScale = UIScreen.main.scale
        imageView?.layer.shouldRasterize = true
        imageView?.contentMode = .scaleAspectFill
        
        dotBackContainer = ASRInnerButton()
        addSubview(dotBackContainer.unsafelyUnwrapped)
        dotBackContainer?.backgroundColor = .clear
        dotBackContainer?.layer.rasterizationScale = UIScreen.main.scale
        dotBackContainer?.layer.shouldRasterize = true
        
        dotContainer = ASRInnerButton()
        addSubview(dotContainer.unsafelyUnwrapped)
        dotContainer?.backgroundColor = .clear
        dotContainer?.layer.rasterizationScale = UIScreen.main.scale
        dotContainer?.layer.shouldRasterize = true
    }
    
    public func setupConstraints() {
        if #available(iOS 9.0, *) {
            imageView?.translatesAutoresizingMaskIntoConstraints = false
            imageView?.topAnchor.constraint(equalTo: topAnchor).isActive = true
            imageView?.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
            imageView?.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
            imageView?.widthAnchor.constraint(equalTo: heightAnchor).isActive = true
            
            dotBackContainer?.translatesAutoresizingMaskIntoConstraints = false
            dotBackContainer?.topAnchor.constraint(equalTo: imageView.unsafelyUnwrapped.topAnchor, constant: BACPADDING).isActive = true
            dotBackContainer?.leftAnchor.constraint(equalTo: imageView.unsafelyUnwrapped.leftAnchor, constant: BACPADDING).isActive = true
            dotBackContainer?.rightAnchor.constraint(equalTo: imageView.unsafelyUnwrapped.rightAnchor, constant: -BACPADDING).isActive = true
            dotBackContainer?.bottomAnchor.constraint(equalTo: imageView.unsafelyUnwrapped.bottomAnchor, constant: -BACPADDING).isActive = true
            
            dotContainer?.translatesAutoresizingMaskIntoConstraints = false
            dotContainer?.topAnchor.constraint(equalTo: imageView.unsafelyUnwrapped.topAnchor, constant: PADDING).isActive = true
            dotContainer?.leftAnchor.constraint(equalTo: imageView.unsafelyUnwrapped.leftAnchor, constant: PADDING).isActive = true
            dotContainer?.rightAnchor.constraint(equalTo: imageView.unsafelyUnwrapped.rightAnchor, constant: -PADDING).isActive = true
            dotContainer?.bottomAnchor.constraint(equalTo: imageView.unsafelyUnwrapped.bottomAnchor, constant: -PADDING).isActive = true
        } else {
            // Fallback on earlier versions
        }
    }
    
    func select() {
        highlightImage(true)
        highlightDotBackColor(true)
        dotContainer?.select()
    }
    
    func deselect() {
        highlightImage(false)
        highlightDotBackColor(false)
        dotContainer?.deselect()
    }
    
    private func highlightImage(_ isSelected: Bool) {
        imageView?.backgroundColor = isSelected ? imageBackColorSelected : imageBackColor
    }
    
    private func highlightDotBackColor(_ isSelected: Bool) {
        dotBackContainer?.backgroundColor = isSelected ? dotBackColorSelected : dotBackColor
    }
    
    public func setImageColor(_ normal: UIColor, _ isSelected: UIColor) {
        imageBackColor = normal
        imageBackColorSelected = isSelected
        highlightImage(false)
    }
    
    public func setDotBackColor(_ normal: UIColor, _ isSelected: UIColor) {
        dotBackColor = normal
        dotBackColorSelected = isSelected
        highlightDotBackColor(false)
    }
    
    public func setDotColor(_ normal: UIColor, _ selected: UIColor, _ isSelected: Bool) {
        dotContainer?.setDotColor(normal, selected, isSelected)
    }
}

public class ASRInnerButton: UIView {
    public var dotContainer: UIView?
    public var PADDING: CGFloat = 0
    public var isCornerRadius = true
    public var dotColor: UIColor = UIColor(hexString: "38B6FF")
    public var dotColorSelected: UIColor = .gray
    
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
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        if isCornerRadius {
            let cornerRadius = (dotContainer?.bounds.size.height ?? 0) * 0.5
            dotContainer?.layer.cornerRadius = cornerRadius
        }
    }
    
    public func setup() {
        setupUIElements()
        setupConstraints()
    }
    
    public func setupUIElements() {
        dotContainer = UIView()
        addSubview(dotContainer.unsafelyUnwrapped)
        dotContainer?.backgroundColor = .clear
        dotContainer?.layer.rasterizationScale = UIScreen.main.scale
        dotContainer?.layer.shouldRasterize = true
    }
    
    public func setupConstraints() {
        if #available(iOS 9.0, *) {
            dotContainer?.translatesAutoresizingMaskIntoConstraints = false
            dotContainer?.topAnchor.constraint(equalTo: topAnchor, constant: PADDING).isActive = true
            dotContainer?.leftAnchor.constraint(equalTo: leftAnchor, constant: PADDING).isActive = true
            dotContainer?.rightAnchor.constraint(equalTo: rightAnchor, constant: -PADDING).isActive = true
            dotContainer?.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -PADDING).isActive = true
        } else {
            // Fallback on earlier versions
        }
    }
    
    func select() {
        hilightSelectedButton(true)
    }
    
    func deselect() {
        hilightSelectedButton(false)
    }
    
    private func hilightSelectedButton(_ isSelected: Bool) {
        dotContainer?.backgroundColor = isSelected ? dotColor : dotColorSelected
    }
    
    public func setDotColor(_ normal: UIColor, _ selected: UIColor, _ isSelected: Bool) {
        dotColor = normal
        dotColorSelected = selected
        hilightSelectedButton(isSelected)
    }
}

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
