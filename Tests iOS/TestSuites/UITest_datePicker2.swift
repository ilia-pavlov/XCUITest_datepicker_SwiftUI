//
//  UITest_datePicker2.swift
//  Tests iOS
//
//  Created by Pavlov, Ilia on 4/1/22.
//

import Foundation

class UITest_datePicker2: TestBase {
    
    func test1() {
        mainView.whenINavigateToDatePicker2()
        mainView.adjustPickerWheelValueTo(value: "9 o’clock", WheelNumberIs: 0)
    }
    
    func test2() {
        mainView.whenINavigateToDatePicker2()
        mainView.adjustPickerWheelValueTo(value: "37 minutes", WheelNumberIs: 1)
    }
    
    func test3() {
        demoView.whenICallYou()
        demoView.thenAnimalJumping()
    }
    
//    func test3() {
//        mainView.whenINavigateToDatePicker2()
//        mainView.adjustPickerWheelValueTo(value: "PM", WheelNumberIs: 2)
//    }
//
//    func test4() {
//        mainView.whenINavigateToDatePicker2()
//        mainView.adjustTimePickerWheelValuesTo(hours: "10 o’clock", mins: "25 minutes", daytime: "AM")
//    }
}
