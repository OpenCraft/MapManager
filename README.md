# MapManager

[![Version](https://img.shields.io/cocoapods/v/MapManager.svg?style=flat)](http://cocoapods.org/pods/MapManager)
[![License](https://img.shields.io/cocoapods/l/MapManager.svg?style=flat)](http://cocoapods.org/pods/MapManager)
[![Platform](https://img.shields.io/cocoapods/p/MapManager.svg?style=flat)](http://cocoapods.org/pods/MapManager)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

MapManager is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "MapManager"
```

## Usage

```swift
let pin = MapPin(at: map.centerCoordinate)
    .setImage(pinIcon, offSet: .centerBottom)
    .setDidSelect { _, _, annotationView in
        annotationView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
    }.setDidDeselect { _, _, annotationView in
        annotationView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
}

map.addPin(pin)
```

## Author

Henrique Morbin, morbin_@hotmail.com

## License

MapManager is available under the MIT license. See the LICENSE file for more info.
