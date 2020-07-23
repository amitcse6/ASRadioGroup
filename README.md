# ASRadioGroup

[![CI Status](https://img.shields.io/travis/amitpstu1@gmail.com/ASRadioGroup.svg?style=flat)](https://travis-ci.org/amitpstu1@gmail.com/ASRadioGroup)
[![Version](https://img.shields.io/cocoapods/v/ASRadioGroup.svg?style=flat)](https://cocoapods.org/pods/ASRadioGroup)
[![License](https://img.shields.io/cocoapods/l/ASRadioGroup.svg?style=flat)](https://cocoapods.org/pods/ASRadioGroup)
[![Platform](https://img.shields.io/cocoapods/p/ASRadioGroup.svg?style=flat)](https://cocoapods.org/pods/ASRadioGroup)

Screenshots
---------
![ASRadioGroup Screenshots](asradiogroup_screenshot.gif)

## Example

```swift
import ASRadioGroup

class ViewController: UIViewController {
    @IBOutlet weak var asRadioGroup: ASRadioGroupClassic! 
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        asRadioGroup
            .setDelegate(self)
            .setRadioButtons([ASRadioButtonClassic("Mobile"), ASRadioButtonClassic("Email")], .vertical)
    }
}

extension ViewController: ASRadioGroupDelegate {
    func radioButtonEvent(_ radioGroup: ASRadioGroup, _ button: ASRadioButton) {
        print("index: \(button.index)")
    }
}

```

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

ASRadioGroup is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ASRadioGroup'
```

## Author

amitpstu1@gmail.com, amitpstu1@gmail.com

## License

ASRadioGroup is available under the MIT license. See the LICENSE file for more info.
