# NPPencil

[![CI Status](https://img.shields.io/travis/DarkKnightOne/NPPencil.svg?style=flat)](https://travis-ci.org/DarkKnightOne/NPPencil)
[![Version](https://img.shields.io/cocoapods/v/NPPencil.svg?style=flat)](https://cocoapods.org/pods/NPPencil)
[![License](https://img.shields.io/cocoapods/l/NPPencil.svg?style=flat)](https://cocoapods.org/pods/NPPencil)
[![Platform](https://img.shields.io/cocoapods/p/NPPencil.svg?style=flat)](https://cocoapods.org/pods/NPPencil)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

```
// 1. import header
#include <NPPencil/NPPencilCanvas.h>

// 2. add to super view like a view
NPPencilCanvas *canvas = [[NPPencilCanvas alloc] initWithFrame:self.view.bounds];
[self.view addSubview:canvas];

// 3. set pencil color and width and so on.
canvas.material = [NPPencilMaterial materialWithColor:[UIColor blueColor] bodyWeight:10.0f shadowColor:[UIColor greenColor] shadowWeight:5.0f];
```

![snap shot](https://github.com/DarkKnightOne/NPPencil/blob/master/snapshot.png)

## Requirements

## Installation

NPPencil is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'NPPencil', '~> 0.0.1'
```

## Author

DarkKnightOne, zhangwenhai1989@gmail.com

## License

NPPencil is available under the MIT license. See the LICENSE file for more info.
