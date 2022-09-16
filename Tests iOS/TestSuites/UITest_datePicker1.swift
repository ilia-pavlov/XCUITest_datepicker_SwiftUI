//
//  Tests_iOS.swift
//  Tests iOS
//
//  Created by Pavlov, Ilia on 3/29/22.
//

import XCTest

class UITest_datePicker1: TestBase {
    
    func test1() {
        mainView.whenINavigateToDatePicker1()
        mainView.adjustPickerWheelValuesTo(year: "1980" , month: "March")
    }

    func test2() {
        mainView.whenINavigateToDatePicker1()
        mainView.adjustPickerWheelValuesTo(year: "1964" , month: "May")
    }

    func test3() {
        mainView.whenINavigateToDatePicker1()
        mainView.adjustPickerWheelValuesTo(year: "2016" , month: "June")
    }
    
    func test4() {
        mainView.whenINavigateToDatePicker1()
        mainView.thenIAdjustPickerWheel()
    }
    
//    func test4() {
//        mainView.whenINavigateToDatePicker1()
//        mainView.adjustPickerWheelValuesTo(year: "1997" , month: "December")
//    }
//
//    func test5() {
//        mainView.whenINavigateToDatePicker1()
//        mainView.adjustPickerWheelValuesTo(year: "2020" , month: "June")
//    }
//
//    func test6() {
//        mainView.whenINavigateToDatePicker1()
//        mainView.adjustPickerWheelValuesTo(year: "2019" , month: "June")
//    }
//
//    func test7() {
//        mainView.whenINavigateToDatePicker1()
//        mainView.adjustPickerWheelValuesTo(year: "2016" , month: "June")
//    }
//
//    func test8() {
//        mainView.whenINavigateToDatePicker1()
//        mainView.adjustPickerWheelValuesTo(year: "2035" , month: "June")
//    }
}

