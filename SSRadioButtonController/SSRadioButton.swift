//
//  SSRadioButton.swift
//  SampleProject
//
//  Created by Shamas on 18/05/2015.
//  Copyright (c) 2015 Al Shamas Tufail. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable

class SSRadioButton: UIButton {

    var buttonSelected = false
    var circelLayer = CAShapeLayer()
    @IBInspectable var circleColor: UIColor = UIColor.redColor()
    @IBInspectable var circleRadius: CGFloat = 10.0
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }

    func circleFrame() -> CGRect {
        var circleFrame = CGRect(x: 0, y: 0, width: 2*circleRadius, height: 2*circleRadius)
        circleFrame.origin.x = 0 + circelLayer.lineWidth
        circleFrame.origin.y = bounds.height/2 - circleFrame.height/2
        return circleFrame
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }


    func initialize() {
        circelLayer.frame = bounds
        circelLayer.lineWidth = 2
        circelLayer.fillColor = UIColor.clearColor().CGColor
        circelLayer.strokeColor = circleColor.CGColor
        layer.addSublayer(circelLayer)
    }

    func toggleButon() {
        if buttonSelected {
            circelLayer.fillColor = UIColor.redColor().CGColor
            buttonSelected = false
        } else {
            circelLayer.fillColor = UIColor.clearColor().CGColor
            buttonSelected = true
        }
    }

    func circlePath() -> UIBezierPath {
        return UIBezierPath(ovalInRect: circleFrame())
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        circelLayer.frame = bounds
        circelLayer.path = circlePath().CGPath
    }

    override func prepareForInterfaceBuilder() {
        initialize()
    }
}
