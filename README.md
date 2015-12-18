# AnimatablePlayButton

Animated Button written in Swift2.0, using CALayer.

![sample](Screenshots/example01.gif)

## features
- Only using CAShapeLayer, no image.

## Requirements
- iOS 8.0+
- Swift 2.0+
- ARC

## Installation
#### Carthage
TODO

#### CocoaPods
TODO

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
