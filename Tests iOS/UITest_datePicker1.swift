//
//  Tests_iOS.swift
//  Tests iOS
//
//  Created by Pavlov, Ilia on 3/29/22.
//

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
}

