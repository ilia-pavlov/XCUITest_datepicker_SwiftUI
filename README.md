## [SwiftUI not supported adjusting picker wheel value](https://medium.com/@iliapavlov314/swiftui-not-supported-adjusting-picker-wheel-value-7640adb2b3e8)
xcode 13.2.1/swift 5.5.2
custom solution

## Historically
>for lazy fellows just jump over to “How it works?”

Hello everyone, probably many of you met this issue when Picker Wheel adjustments is not working properly or doesn’t work at all (completely dead for UI Automation Testing). The most common reason why, is starting to use SwiftUI instead of UIKit.
#### Digging in issue
![Digging in issue](https://user-images.githubusercontent.com/68978403/162481421-d74bdfb1-0f87-4555-8545-66ada1f73a91.png)


- Step 1. Error tell us “Unsupported picker wheel…..”. So let’s check if path to element is right(it’s obviously since error tell as about element) try to adjust from debugger and see the log.

![Error](https://user-images.githubusercontent.com/68978403/162481480-00b2c166-66f1-4ef7-8291-9d942b093261.png)

- Step2. Try to find any other solution to work around: `swipeUp()` and `swipeDown()` while condition will be true, and this is the bad one 100%. Trying to set in code base parameters to adjust even ideas about API but under the hood nothing is reachable since UIDatePicker was programmed not for that.

#### Solution: was obvious for those who familiar with Appium or any other cross platform tools for Mobile testing. We will rotate wheel via coordinates.
## How it works?
- Step1. Let’s create an extension for `XCUIElemet`. Then we will need two functions `currentPosition()` to return value of the current picker position as String and core of adjustment idea is `rotateUp()` function.
> In different sources, I found : each wheel notch is about 30px high, so tapping y — 30 rotates up. y + 30 rotates down. BUT in my case 20 was the size.
```
extension XCUIElement {
    
func currentPosition() -> String {
    self.value as? String ?? "Error: return value as nil"
}
    
func rotateUp() {
    let x = self.frame.width / 2.0
    let y = self.frame.height / 2.0
    // each wheel notch is about 30px high, so tapping y - 20 rotates up. y + 20 rotates down.
    let offset: CGFloat = -20.0
    let wheelParameters = self.coordinate(withNormalizedOffset: .zero).withOffset(CGVector(dx: x, dy: y + offset))
    wheelParameters.tap()
    }
}
```
- Step2. Core of function `adjustPickerWheelValueTo(value: String, WheelNumberIs: Int)` is while loop. The interesting point here is to make sure condition will be succeed you need wait till rotation is completed and compare with XCUIElement, comparing with value is FAIL, only after including `XCUIElemen`t and `waitForExistence(timeout: 1)` while loop start to work properly. It was a really PAIN POINT!
Also you don’t want to leave while loop without break for whole night(CI tool is not trust guy, it can take your while loop and make it crazy) so secureRotateCount will break a while loop after 100 iterations.

```
func adjustPickerWheelValueTo(value: String, WheelNumberIs: Int) {
        let expectedValue = app.pickerWheels[value]
        var secureRotateCount = 0
        while !expectedValue.waitForExistence(timeout: 1) {
            pickerWheel(number: WheelNumberIs).rotateUp()
            secureRotateCount += 1
            // assuming 100 iterations is MAX
            // secureRotateCount will break a while loop after 100 iterations
            if secureRotateCount == 100 {
                XCTFail("Adjustment FAIL to set value \(value), secure Rotate count break adjustment, current picker wheel value set to \(pickerWheel(number: WheelNumberIs).currentPosition())")
            }
        }
    }
```

#### Also you can pass whole element instead Int
- Step3. For my case, I have single view app with two date picker (technically one Date picker) one of them has 2 wheels, another 3 wheels.
For two wheels passing year and month as String, and (in this case) hardcoded wheel by index 0 or 1 (better store element in variable)

> adjust date picker with 2 wheels
``` 
 /**
     Adjust two picker wheels to set value
     - Parameters:
        - year: pass string with year (1990,1976, etc.)
        -   month: pass string with moth (May, Jun, etc.)
     */
    func adjustPickerWheelValuesTo(year: String , month: String) {
        adjustPickerWheelValueTo(value: year, WheelNumberIs: 1)
        adjustPickerWheelValueTo(value: month, WheelNumberIs: 0)
        
        // For test purposes to get message with current picker values
        XCTAssertTrue(monthButton.currentPosition() == month + " " + year, "Adjustment FAIL to set value \(month + year) instead set to \(monthButton.currentPosition())")
    }
```
> Test class
``` 
import XCTest

class UITest_datePicker1: UITestBase {
    
    func test1() {
        hub.navigateToDatePicker1()
        hub.adjustPickerWheelValuesTo(year: "1980" , month: "March")
    }

    func test2() {
        hub.navigateToDatePicker1()
        hub.adjustPickerWheelValuesTo(year: "1964" , month: "May")
    }

    func test3() {
        hub.navigateToDatePicker1()
        hub.adjustPickerWheelValuesTo(year: "2003" , month: "June")
    }
    
    func test4() {
        hub.navigateToDatePicker1()
        hub.adjustPickerWheelValuesTo(year: "1997" , month: "December")
    }
    
    func test5() {
        hub.navigateToDatePicker1()
        hub.adjustPickerWheelValuesTo(year: "2020" , month: "June")
    }
    
    func test6() {
        hub.navigateToDatePicker1()
        hub.adjustPickerWheelValuesTo(year: "2019" , month: "June")
    }
    
    func test7() {
        hub.navigateToDatePicker1()
        hub.adjustPickerWheelValuesTo(year: "2016" , month: "June")
    }
    
    func test8() {
        hub.navigateToDatePicker1()
        hub.adjustPickerWheelValuesTo(year: "2035" , month: "June")
    }
    
    func test9() {
        hub.navigateToDatePicker1()
        hub.whenIAdjustPickerWheelValue(to: "2015")
    }
}
```

For 3 wheels passing hours, mins, daytime as String, and (in this case) hardcoded wheel by index 0 , 1, 2 (better store element in variable)
Notes: best way to assert datePicker value is using Date class for any cases.

> adjust date picker with 3 wheels
```
 /**
     Adjust 3 picker wheels to set value
     - Parameters:
        - hours: pass string with hours (10 o’clock, 8 o’clock, etc.)
        -   mins: pass string with mins (37 minutes, 15 minutes, etc.)
        - daytime: pass string with daytime (PM, AM)
     */
    func adjustTimePickerWheelValuesTo(hours: String , mins: String, daytime: String) {
        adjustPickerWheelValueTo(value: hours, WheelNumberIs: 0)
        adjustPickerWheelValueTo(value: mins, WheelNumberIs: 1)
        adjustPickerWheelValueTo(value: daytime, WheelNumberIs: 2)
        
        // Notes: best way to assert datePicker value is start to format Strings in Date class.
    }
```
> In Test class not the all tests adjusting all 3 wheel only test4()
> Test class

```
import Foundation

class UITest_datePicker2: UITestBase {
    
    func test1() {
        hub.navigateToDatePicker2()
        hub.adjustPickerWheelValueTo(value: "9 o’clock", WheelNumberIs: 0)
    }
    
    func test2() {
        hub.navigateToDatePicker2()
        hub.adjustPickerWheelValueTo(value: "37 minutes", WheelNumberIs: 1)
    }
    
    func test3() {
        hub.navigateToDatePicker2()
        hub.adjustPickerWheelValueTo(value: "PM", WheelNumberIs: 2)
    }
    
    func test4() {
        hub.navigateToDatePicker2()
        hub.adjustTimePickerWheelValuesTo(hours: "10 o’clock", mins: "25 minutes", daytime: "AM")
    }
}
```

I hope it was helpful!


