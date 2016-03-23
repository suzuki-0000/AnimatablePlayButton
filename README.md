AnimatablePlayButton
========================

[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/AnimatablePlayButton.svg?style=flat)](http://cocoadocs.org/docsets/AnimatablePlayButton)
[![Swift 2.0](https://img.shields.io/badge/Swift-2.0-orange.svg?style=flat)](https://developer.apple.com/swift/)

Animated Play and Pause Button written in Swift, using CALayer, CAKeyframeAnimation.

![sample](Screenshots/example01.gif)

## features
- Only using CAShapeLayer, CAKeyframeAnimation. not from image object.

## Requirements
- iOS 8.0+
- Swift 2.0+
- ARC

##Installation

####CocoaPods
available on CocoaPods. Just add the following to your project Podfile:
```
pod 'AnimatablePlayButton'
use_frameworks!
```

####Carthage
To integrate into your Xcode project using Carthage, specify it in your Cartfile:

```ogdl
github "suzuki-0000/AnimatablePlayButton"
```

## How to use
#### 1. Create a button, specify backgroundColor of Button(bgColor), and button color(color).
```swift
let button = AnimatablePlayButton(frame: CGRectMake(0, 0, 44, 44))
button.bgColor = .blackColor()
button.color = .whiteColor()
self.view.addSubview(button)
```

#### 2. Add tapped function
```swift
button.addTarget(self, action: Selector("tapped:"), forControlEvents: .TouchUpInside)
```
```swift
func tapped(sender: AnimatablePlayButton) {
    if sender.selected {
        sender.deselect()
    } else {
        sender.select()
    }
}
```

## License
available under the MIT license. See the LICENSE file for more info.

