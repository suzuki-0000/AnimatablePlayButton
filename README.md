# AnimatablePlayButton

Animated Button written in Swift2.0, using CALayer.

![sample](Screenshots/example01.gif)

## features
- YouTube Player and its new morphing play/pause button, I wanted to understand how it was made and replicate it myself.
- I tried to make it using CAShapeLayer, and keyframe animation. 
- It seems like it, but not elegant. no extendable. 

## Requirements
- iOS 8.0+
- Swift 2.0+
- ARC

## Installation
#### Carthage
Add the following line to your `Cartfile`:
```
github "suzuki-0000/AnimatablePlayButton"
```

#### CocoaPods
Add the following line to your `Podfile`:
```
pod 'AnimatablePlayButton'
```

## How to use
See the code snippet below for an example of how to implement, or example project would be easy to understand.

#### 1. Create a button, specify backgroundColor of Button(bgColor), and button color(color).
```swift
let button = AnimatablePlayButton(frame: CGRectMake(0, 0, 44, 44))
button.bgColor = UIColor(red: 38.0 / 255, green: 151.0 / 255, blue: 68.0 / 255, alpha: 1)
button.color = .whiteColor()
self.view.addSubview(button)
```

#### 2. Add tapped function
```swift
button.addTarget(self, action: Selector("tapped:"), forControlEvents: .TouchUpInside)
```
```swift
func tapped(sender: DOFavoriteButton) {
    if sender.selected {
        sender.deselect()
    } else {
        sender.select()
    }
}
```

## License
available under the MIT license. See the LICENSE file for more info.

