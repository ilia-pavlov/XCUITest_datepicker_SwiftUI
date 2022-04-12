//
//  UITest_datePicker2.swift
//  Tests iOS
//
//  Created by Pavlov, Ilia on 4/1/22.
//

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
