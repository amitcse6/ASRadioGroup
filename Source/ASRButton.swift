//
//  ASRButton.swift
//  ASRadioGroup
//
//  Created by Amit on 14/7/20.
//

import Foundation

public class ASRButton: UIView {
    public var imageView: UIImageView?
    public var dotContainer: ASRInnerButton?
    public var PADDING: CGFloat = 2
    public var isCornerRadius = true
    
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
        hilightSelectedButton(true)
        dotContainer?.select()
    }
    
    func deselect() {
        hilightSelectedButton(false)
        dotContainer?.deselect()
    }
    
    private func hilightSelectedButton(_ isSelected: Bool) {
        imageView?.backgroundColor = isSelected ? .cyan : .gray
        
    }
}

public class ASRInnerButton: UIView {
    public var dotContainer: UIView?
    public var PADDING: CGFloat = 0
    public var isCornerRadius = true
    
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
        dotContainer?.backgroundColor = isSelected ? .red : .gray
    }
}
