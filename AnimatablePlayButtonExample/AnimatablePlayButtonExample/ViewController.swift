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
        
        view.backgroundColor = .blackColor()
        
        let button = AnimatablePlayButton(lengthOfSize: 120)
        button.center = CGPointMake(CGRectGetMidX(view.frame), CGRectGetMidY(view.frame))
        button.bgColor = .blackColor()
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

