//
//  AnimatablePlayButton.swift
//  AnimatablePlayButton
//
//  Created by suzuki keishi on 2015/12/01.
//  Copyright © 2015 suzuki_keishi. All rights reserved.
//

import UIKit

public class AnimatablePlayButton: UIButton {
    
    public var color: UIColor! = .whiteColor() {
        didSet {
            pauseLeft.strokeColor = color.CGColor
            pauseLeftMover.strokeColor = color.CGColor
            pauseRight.strokeColor = color.CGColor
            pauseRightMover.strokeColor = color.CGColor
        }
    }
    public var bgColor: UIColor! = .blackColor() {
        didSet {
            backgroundColor = bgColor
            playTop.strokeColor = bgColor.CGColor
            playBottom.strokeColor = bgColor.CGColor
        }
    }
    
    private let pauseLeftSelectAnimation = CAKeyframeAnimation(keyPath: "transform")
    private let pauseRightSelectAnimation = CAKeyframeAnimation(keyPath: "transform")
    private let playTopSelectAnimation = CAKeyframeAnimation(keyPath: "transform")
    private let playBottomSelectAnimation = CAKeyframeAnimation(keyPath: "transform")
    private let pauseLeftDeSelectAnimation = CAKeyframeAnimation(keyPath: "transform")
    private let pauseRightDeSelectAnimation = CAKeyframeAnimation(keyPath: "transform")
    private let playTopDeSelectAnimation = CAKeyframeAnimation(keyPath: "transform")
    private let playBottomDeSelectAnimation = CAKeyframeAnimation(keyPath: "transform")
    
    private var pauseLeft: CAShapeLayer = CAShapeLayer()
    private var pauseLeftMover: CAShapeLayer = CAShapeLayer()
    private var pauseRight: CAShapeLayer = CAShapeLayer()
    private var pauseRightMover: CAShapeLayer = CAShapeLayer()
    private var playTop: CAShapeLayer = CAShapeLayer()
    private var playBottom: CAShapeLayer = CAShapeLayer()
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        createLayers(frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
        createLayers(frame)
    }
    
    override public required init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        createLayers(frame)
    }
    
    convenience public init(origin: CGPoint, lengthOfSize: CGFloat){
        self.init(frame: CGRectMake(origin.x, origin.y, lengthOfSize, lengthOfSize))
    }
    
    convenience public init(lengthOfSize: CGFloat){
        self.init(frame: CGRectMake(0, 0, lengthOfSize, lengthOfSize))
    }
    
    // MARK: - private
    private func setup(){
        clipsToBounds = true
        bgColor = .blackColor()
        color = .whiteColor()
    }
    
    private func createLayers(frame: CGRect) {
        
        let pauseLineWidth:CGFloat = bounds.width/5
        let pauseLine:CGFloat = pauseLineWidth * 2
        let pausePadding:CGFloat = (bounds.height/5)
        let pauseHeight = bounds.height-(pausePadding*2)
        
        let pausePath: CGPath = {
            let path = CGPathCreateMutable()
            CGPathMoveToPoint(path, nil, 0, 0)
            CGPathAddLineToPoint(path, nil, 0, pauseHeight)
            return path
        }()
        
        pauseLeft.path = pausePath
        pauseLeftMover.path = pausePath
        pauseRight.path = pausePath
        pauseRightMover.path = pausePath
        playTop.path =  {
            let path = CGPathCreateMutable()
            CGPathMoveToPoint(path, nil, 0, 0)
            CGPathAddLineToPoint(path, nil, bounds.width, bounds.height / 2)
            return path
            }()
        playBottom.path = {
            let path = CGPathCreateMutable()
            CGPathMoveToPoint(path, nil, 0, bounds.height)
            CGPathAddLineToPoint(path, nil, bounds.width, bounds.height / 2)
            return path
            }()
        
        
        pauseLeft.frame = CGRectMake((bounds.width/5)*1, pausePadding, pauseLine, pauseHeight)
        pauseLeft.lineWidth = pauseLine
        pauseLeft.masksToBounds = true
        layer.addSublayer(pauseLeft)
        
        pauseLeftMover.frame = CGRectMake((bounds.width/5)*1, pausePadding, pauseLine * 1.25, pauseHeight)
        pauseLeftMover.lineWidth = pauseLine * 1.25
        pauseLeftMover.masksToBounds = true
        layer.addSublayer(pauseLeftMover)
        
        pauseRight.frame = CGRectMake((bounds.width/5)*3, pausePadding, pauseLine, pauseHeight)
        pauseRight.lineWidth = pauseLine
        pauseRight.masksToBounds = true
        layer.addSublayer(pauseRight)
        
        pauseRightMover.frame = CGRectMake((bounds.width/5)*3, pausePadding, pauseLine * 1.25, pauseHeight)
        pauseRightMover.lineWidth = pauseLine * 1.25
        pauseRightMover.masksToBounds = true
        layer.addSublayer(pauseRightMover)
        
        playTop.frame = CGRectMake(0, -bounds.height, bounds.width-1, bounds.height)
        playTop.lineWidth = pauseLineWidth * 3
        playTop.masksToBounds = true
        layer.addSublayer(playTop)
        
        playBottom.frame = CGRectMake(0, bounds.height, bounds.width-1, bounds.height)
        playBottom.lineWidth = pauseLineWidth * 3
        playBottom.masksToBounds = true
        layer.addSublayer(playBottom)
        
        // SELECT
        pauseLeftSelectAnimation.values = [
            NSValue(CATransform3D: CATransform3DMakeTranslation(pauseLineWidth * 0, 0, 0)),
            NSValue(CATransform3D: CATransform3DMakeTranslation(pauseLineWidth * 0.51, 0, 0)),
            NSValue(CATransform3D: CATransform3DMakeTranslation(pauseLineWidth * 0.51, 0, 0)),
            NSValue(CATransform3D: CATransform3DMakeTranslation(pauseLineWidth * 0.51, 0, 0)),
            NSValue(CATransform3D: CATransform3DMakeTranslation(pauseLineWidth * 0.51, 0, 0)),
        ]
        pauseRightSelectAnimation.values = [
            NSValue(CATransform3D: CATransform3DMakeTranslation(-pauseLineWidth * 0, 0, 0)),
            NSValue(CATransform3D: CATransform3DMakeTranslation(-pauseLineWidth * 0.51, 0, 0)),
            NSValue(CATransform3D: CATransform3DMakeTranslation(-pauseLineWidth * 0.51, 0, 0)),
            NSValue(CATransform3D: CATransform3DMakeTranslation(-pauseLineWidth * 0.51, 0, 0)),
            NSValue(CATransform3D: CATransform3DMakeTranslation(-pauseLineWidth * 0.51, 0, 0)),
        ]
        playTopSelectAnimation.values = [
            NSValue(CATransform3D: CATransform3DMakeTranslation(0, bounds.height * 0.3, 0)),
            NSValue(CATransform3D: CATransform3DMakeTranslation(0, bounds.height * 0.76, 0)),
            NSValue(CATransform3D: CATransform3DMakeTranslation(0, bounds.height * 0.76, 0)),
            NSValue(CATransform3D: CATransform3DMakeTranslation(0, bounds.height * 0.76, 0)),
            NSValue(CATransform3D: CATransform3DMakeTranslation(0, bounds.height * 0.76, 0)),
        ]
        playBottomSelectAnimation.values = [
            NSValue(CATransform3D: CATransform3DMakeTranslation(0, -bounds.height * 0.3, 0)),
            NSValue(CATransform3D: CATransform3DMakeTranslation(0, -bounds.height * 0.76, 0)),
            NSValue(CATransform3D: CATransform3DMakeTranslation(0, -bounds.height * 0.76, 0)),
            NSValue(CATransform3D: CATransform3DMakeTranslation(0, -bounds.height * 0.76, 0)),
            NSValue(CATransform3D: CATransform3DMakeTranslation(0, -bounds.height * 0.76, 0)),
        ]
        
        // DESELECT
        pauseLeftDeSelectAnimation.values = [
            NSValue(CATransform3D: CATransform3DMakeTranslation(pauseLineWidth * 0.5, 0, 0)),
            NSValue(CATransform3D: CATransform3DMakeTranslation(pauseLineWidth * 0.2, 0, 0)),
            NSValue(CATransform3D: CATransform3DMakeTranslation(pauseLineWidth * 0.1, 0, 0)),
            NSValue(CATransform3D: CATransform3DMakeTranslation(pauseLineWidth * 0.0, 0, 0)),
            NSValue(CATransform3D: CATransform3DMakeTranslation(pauseLineWidth * 0.0, 0, 0)),
        ]
        pauseRightDeSelectAnimation.values = [
            NSValue(CATransform3D: CATransform3DMakeTranslation(-pauseLineWidth * 0.5, 0, 0)),
            NSValue(CATransform3D: CATransform3DMakeTranslation(-pauseLineWidth * 0.2, 0, 0)),
            NSValue(CATransform3D: CATransform3DMakeTranslation(-pauseLineWidth * 0.1, 0, 0)),
            NSValue(CATransform3D: CATransform3DMakeTranslation(-pauseLineWidth * 0.0, 0, 0)),
            NSValue(CATransform3D: CATransform3DMakeTranslation(-pauseLineWidth * 0.0, 0, 0)),
        ]
        playTopDeSelectAnimation.values = [
            NSValue(CATransform3D: CATransform3DMakeTranslation(0, bounds.height * 0.76, 0)),
            NSValue(CATransform3D: CATransform3DMakeTranslation(0, bounds.height * 0.4, 0)),
            NSValue(CATransform3D: CATransform3DMakeTranslation(0, bounds.height * 0.3, 0)),
            NSValue(CATransform3D: CATransform3DMakeTranslation(0, bounds.height * 0.2, 0)),
            NSValue(CATransform3D: CATransform3DIdentity),
        ]
        playBottomDeSelectAnimation.values = [
            NSValue(CATransform3D: CATransform3DMakeTranslation(0, -bounds.height * 0.76, 0)),
            NSValue(CATransform3D: CATransform3DMakeTranslation(0, -bounds.height * 0.4, 0)),
            NSValue(CATransform3D: CATransform3DMakeTranslation(0, -bounds.height * 0.3, 0)),
            NSValue(CATransform3D: CATransform3DMakeTranslation(0, -bounds.height * 0.2, 0)),
            NSValue(CATransform3D: CATransform3DIdentity),
        ]
        
        setPauseProperty(pauseLeftSelectAnimation)
        setPauseProperty(pauseRightSelectAnimation)
        setCommonProperty(playTopSelectAnimation)
        setCommonProperty(playBottomSelectAnimation)
    }
    
    private func setPauseProperty(animation: CAKeyframeAnimation) {
        animation.duration = 0.4
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        animation.removedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
    }
    
    private func setCommonProperty(animation: CAKeyframeAnimation) {
        animation.duration = 0.4
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.removedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
    }
    
    // MARK: - public
    public func select() {
        selected = true
        
        pauseLeftMover.removeAllAnimations()
        pauseRightMover.removeAllAnimations()
        playTop.removeAllAnimations()
        playBottom.removeAllAnimations()
        
        CATransaction.begin()
        
        pauseLeftMover.addAnimation(pauseLeftSelectAnimation, forKey: "transform")
        pauseRightMover.addAnimation(pauseRightSelectAnimation, forKey: "transform")
        playTop.addAnimation(playTopSelectAnimation, forKey: "transform")
        playBottom.addAnimation(playBottomSelectAnimation, forKey: "transform")
        
        CATransaction.commit()
    }
    
    public func deselect() {
        selected = false
        
        pauseLeftMover.removeAllAnimations()
        pauseRightMover.removeAllAnimations()
        playTop.removeAllAnimations()
        playBottom.removeAllAnimations()
        
        CATransaction.begin()
        
        pauseLeftMover.addAnimation(pauseLeftDeSelectAnimation, forKey: "transform")
        pauseRightMover.addAnimation(pauseRightDeSelectAnimation, forKey: "transform")
        playTop.addAnimation(playTopDeSelectAnimation, forKey: "transform")
        playBottom.addAnimation(playBottomDeSelectAnimation, forKey: "transform")
        
        CATransaction.commit()
    }
}