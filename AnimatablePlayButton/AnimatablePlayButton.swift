//
//  AnimatablePlayButton.swift
//  AnimatablePlayButton
//
//  Created by 鈴木 啓司 on 2015/12/01.
//  Copyright © 2015年 suzuki_keishi. All rights reserved.
//

import UIKit

@IBDesignable
public class AnimatablePlayButton: UIButton {
	
	private var pauseLeft: CAShapeLayer = CAShapeLayer()
	private var pauseLeftMover: CAShapeLayer = CAShapeLayer()
	private var pauseRight: CAShapeLayer = CAShapeLayer()
	private var pauseRightMover: CAShapeLayer = CAShapeLayer()
	private var playTop: CAShapeLayer = CAShapeLayer()
	private var playBottom: CAShapeLayer = CAShapeLayer()
	public var color: UIColor! = UIColor.whiteColor() {
		didSet {
			pauseLeft.strokeColor = color.CGColor
			pauseLeftMover.strokeColor = color.CGColor
			pauseRight.strokeColor = color.CGColor
			pauseRightMover.strokeColor = color.CGColor
		}
	}
	public var bgColor: UIColor! = UIColor.blackColor() {
		didSet {
            backgroundColor = bgColor
			playTop.strokeColor = bgColor.CGColor
			playBottom.strokeColor = bgColor.CGColor
		}
	}
	
	private let pauseLeftSelect = CAKeyframeAnimation(keyPath: "transform")
	private let pauseRightSelect = CAKeyframeAnimation(keyPath: "transform")
	private let playTopSelect = CAKeyframeAnimation(keyPath: "transform")
	private let playBottomSelect = CAKeyframeAnimation(keyPath: "transform")
	private let pauseLeftDeselect = CAKeyframeAnimation(keyPath: "transform")
	private let pauseRightDeselect = CAKeyframeAnimation(keyPath: "transform")
	private let playTopDeselect = CAKeyframeAnimation(keyPath: "transform")
	private let playBottomDeselect = CAKeyframeAnimation(keyPath: "transform")
	
    public override func awakeFromNib() {
        super.awakeFromNib()
        createLayers(frame)
		clipsToBounds = true
    }
    
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		createLayers(frame)
		clipsToBounds = true
	}
	
	override public required init(frame: CGRect) {
		super.init(frame: frame)
		createLayers(frame)
		clipsToBounds = true
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
		
		let playTopPath: CGPath = {
			let path = CGPathCreateMutable()
			CGPathMoveToPoint(path, nil, 0, 0)
			CGPathAddLineToPoint(path, nil, bounds.width, bounds.height / 2)
			return path
		}()
		let playBottomPath: CGPath = {
			let path = CGPathCreateMutable()
			CGPathMoveToPoint(path, nil, 0, bounds.height)
			CGPathAddLineToPoint(path, nil, bounds.width, bounds.height / 2)
			return path
		}()
		
		playTop.path = playTopPath
		playBottom.path = playBottomPath
		
		for layer in [ pauseLeft ] {
			layer.frame = CGRectMake((bounds.width/5)*1, pausePadding, pauseLine, pauseHeight)
			layer.lineWidth = pauseLine
			layer.lineCap = kCALineCapSquare
			layer.masksToBounds = true
			self.layer.addSublayer(layer)
		}
		for layer in [ pauseLeftMover ] {
			layer.frame = CGRectMake((bounds.width/5)*1, pausePadding, pauseLine * 1.25, pauseHeight)
			layer.lineWidth = pauseLine * 1.25
			layer.lineCap = kCALineCapSquare
			layer.masksToBounds = true
			self.layer.addSublayer(layer)
		}
		for layer in [ pauseRight ] {
			layer.frame = CGRectMake((bounds.width/5)*3, pausePadding, pauseLine, pauseHeight)
			layer.lineWidth = pauseLine
			layer.lineCap = kCALineCapSquare
			layer.masksToBounds = true
			self.layer.addSublayer(layer)
		}
		for layer in [ pauseRightMover ] {
			layer.frame = CGRectMake((bounds.width/5)*3, pausePadding, pauseLine * 1.25, pauseHeight)
			layer.lineWidth = pauseLine * 1.25
			layer.lineCap = kCALineCapSquare
			layer.masksToBounds = true
			self.layer.addSublayer(layer)
		}
		for layer in [ playTop ] {
			layer.frame = CGRectMake(0, -bounds.height, bounds.width-1, bounds.height)
			layer.lineWidth = pauseLineWidth * 3
			layer.lineCap = kCALineCapSquare
			layer.masksToBounds = true
			self.layer.addSublayer(layer)
		}
		for layer in [ playBottom ] {
			layer.frame = CGRectMake(0, bounds.height, bounds.width-1, bounds.height)
			layer.lineWidth = pauseLineWidth * 3
			layer.lineCap = kCALineCapSquare
			layer.masksToBounds = true
			self.layer.addSublayer(layer)
		}
		
		// SELECT
		pauseLeftSelect.values = [
			NSValue(CATransform3D: CATransform3DMakeTranslation(pauseLineWidth * 0, 0, 0)),
			NSValue(CATransform3D: CATransform3DMakeTranslation(pauseLineWidth * 0.51, 0, 0)),
			NSValue(CATransform3D: CATransform3DMakeTranslation(pauseLineWidth * 0.51, 0, 0)),
			NSValue(CATransform3D: CATransform3DMakeTranslation(pauseLineWidth * 0.51, 0, 0)),
			NSValue(CATransform3D: CATransform3DMakeTranslation(pauseLineWidth * 0.51, 0, 0)),
		]
		pauseRightSelect.values = [
			NSValue(CATransform3D: CATransform3DMakeTranslation(-pauseLineWidth * 0, 0, 0)),
			NSValue(CATransform3D: CATransform3DMakeTranslation(-pauseLineWidth * 0.51, 0, 0)),
			NSValue(CATransform3D: CATransform3DMakeTranslation(-pauseLineWidth * 0.51, 0, 0)),
			NSValue(CATransform3D: CATransform3DMakeTranslation(-pauseLineWidth * 0.51, 0, 0)),
			NSValue(CATransform3D: CATransform3DMakeTranslation(-pauseLineWidth * 0.51, 0, 0)),
		]
		playTopSelect.values = [
			NSValue(CATransform3D: CATransform3DMakeTranslation(0, bounds.height * 0.3, 0)),
			NSValue(CATransform3D: CATransform3DMakeTranslation(0, bounds.height * 0.76, 0)),
			NSValue(CATransform3D: CATransform3DMakeTranslation(0, bounds.height * 0.76, 0)),
			NSValue(CATransform3D: CATransform3DMakeTranslation(0, bounds.height * 0.76, 0)),
			NSValue(CATransform3D: CATransform3DMakeTranslation(0, bounds.height * 0.76, 0)),
		]
		playBottomSelect.values = [
			NSValue(CATransform3D: CATransform3DMakeTranslation(0, -bounds.height * 0.3, 0)),
			NSValue(CATransform3D: CATransform3DMakeTranslation(0, -bounds.height * 0.76, 0)),
			NSValue(CATransform3D: CATransform3DMakeTranslation(0, -bounds.height * 0.76, 0)),
			NSValue(CATransform3D: CATransform3DMakeTranslation(0, -bounds.height * 0.76, 0)),
			NSValue(CATransform3D: CATransform3DMakeTranslation(0, -bounds.height * 0.76, 0)),
		]
		
		// DESELECT
		pauseLeftDeselect.values = [
			NSValue(CATransform3D: CATransform3DMakeTranslation(pauseLineWidth * 0.5, 0, 0)),
			NSValue(CATransform3D: CATransform3DMakeTranslation(pauseLineWidth * 0.2, 0, 0)),
			NSValue(CATransform3D: CATransform3DMakeTranslation(pauseLineWidth * 0.1, 0, 0)),
			NSValue(CATransform3D: CATransform3DMakeTranslation(pauseLineWidth * 0.0, 0, 0)),
			NSValue(CATransform3D: CATransform3DMakeTranslation(pauseLineWidth * 0.0, 0, 0)),
		]
		pauseRightDeselect.values = [
			NSValue(CATransform3D: CATransform3DMakeTranslation(-pauseLineWidth * 0.5, 0, 0)),
			NSValue(CATransform3D: CATransform3DMakeTranslation(-pauseLineWidth * 0.2, 0, 0)),
			NSValue(CATransform3D: CATransform3DMakeTranslation(-pauseLineWidth * 0.1, 0, 0)),
			NSValue(CATransform3D: CATransform3DMakeTranslation(-pauseLineWidth * 0.0, 0, 0)),
			NSValue(CATransform3D: CATransform3DMakeTranslation(-pauseLineWidth * 0.0, 0, 0)),
		]
		playTopDeselect.values = [
			NSValue(CATransform3D: CATransform3DMakeTranslation(0, bounds.height * 0.76, 0)),
			NSValue(CATransform3D: CATransform3DMakeTranslation(0, bounds.height * 0.4, 0)),
			NSValue(CATransform3D: CATransform3DMakeTranslation(0, bounds.height * 0.3, 0)),
			NSValue(CATransform3D: CATransform3DMakeTranslation(0, bounds.height * 0.2, 0)),
			NSValue(CATransform3D: CATransform3DIdentity),
		]
		playBottomDeselect.values = [
			NSValue(CATransform3D: CATransform3DMakeTranslation(0, -bounds.height * 0.76, 0)),
			NSValue(CATransform3D: CATransform3DMakeTranslation(0, -bounds.height * 0.4, 0)),
			NSValue(CATransform3D: CATransform3DMakeTranslation(0, -bounds.height * 0.3, 0)),
			NSValue(CATransform3D: CATransform3DMakeTranslation(0, -bounds.height * 0.2, 0)),
			NSValue(CATransform3D: CATransform3DIdentity),
		]
		
		setPauseProperty(pauseLeftSelect)
		setPauseProperty(pauseRightSelect)
		setCommonProperty(playTopSelect)
		setCommonProperty(playBottomSelect)
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
	
	public func select() {
		selected = true
		
		pauseLeftMover.removeAllAnimations()
		pauseRightMover.removeAllAnimations()
		playTop.removeAllAnimations()
		playBottom.removeAllAnimations()
		
		CATransaction.begin()
		
		pauseLeftMover.addAnimation(pauseLeftSelect, forKey: "transform")
		pauseRightMover.addAnimation(pauseRightSelect, forKey: "transform")
		playTop.addAnimation(playTopSelect, forKey: "transform")
		playBottom.addAnimation(playBottomSelect, forKey: "transform")
		
		CATransaction.commit()
	}
	
	public func deselect() {
		selected = false
		
		pauseLeftMover.removeAllAnimations()
		pauseRightMover.removeAllAnimations()
		playTop.removeAllAnimations()
		playBottom.removeAllAnimations()
		
		CATransaction.begin()
		
		pauseLeftMover.addAnimation(pauseLeftDeselect, forKey: "transform")
		pauseRightMover.addAnimation(pauseRightDeselect, forKey: "transform")
		playTop.addAnimation(playTopDeselect, forKey: "transform")
		playBottom.addAnimation(playBottomDeselect, forKey: "transform")
		
		CATransaction.commit()
	}
}