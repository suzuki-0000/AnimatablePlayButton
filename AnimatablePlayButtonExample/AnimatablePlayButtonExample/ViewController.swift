//
//  ViewController.swift
//  AnimatablePlayButtonExample
//
//  Created by 鈴木 啓司 on 2015/12/14.
//  Copyright © 2015年 suzuki_keishi. All rights reserved.
//

import UIKit
import AnimatablePlayButton

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = AnimatablePlayButton(frame: CGRectMake(0, 0, 44, 44))
        button.center = CGPointMake(CGRectGetMidX(view.frame), CGRectGetMidY(view.frame))
        button.bgColor =  UIColor(red: 38.0 / 255, green: 151.0 / 255, blue: 68.0 / 255, alpha: 1)
        button.color = .whiteColor()
        button.addTarget(self, action: Selector("tapped:"), forControlEvents: UIControlEvents.TouchUpInside)
        
        view.addSubview(button)
    }
    
    func tapped(sender: AnimatablePlayButton) {
        if sender.selected {
            sender.deselect()
        } else {
            sender.select()
        }
    }
}

