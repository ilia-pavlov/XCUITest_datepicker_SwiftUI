//
//  Hub.swift
//  Tests iOS
//
//  Created by Pavlov, Ilia on 4/1/22.
//

import Foundation
import XCTest

class MainView: ScreenBase {
    // ELEMENTS as Static Text, Buttons, Alerts etc
    lazy var datePicker1 = app.buttons.element(boundBy: 0)
    lazy var datePicker2 = app.buttons.element(boundBy: 1)
    lazy var monthButton = app.buttons["Month"]
    
    // Picker Wheels
    lazy var pickerWheelMonth: XCUIElement =  app.pickerWheels.element(boundBy: 0)
    lazy var pickerWheelYear: XCUIElement =  app.pickerWheels.element(boundBy: 1)
    
    
    // MARK: - WHEN
    func whenINavigateToDatePicker1() {
        datePicker1.tap()
        monthButton.tap()
    }
    
    func whenINavigateToDatePicker2() {
        datePicker2.tap()
    }
    
    func thenIAdjustPickerWheel() {
        pickerWheelMonth.adjustPickerWheelTo(value: Months.september.rawValue)
        pickerWheelYear.adjustPickerWheelTo(value: "2010")
    }
    
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
    
    func pickerWheel(number: Int) -> XCUIElement {
        app.pickerWheels.element(boundBy: number)
    }
    
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
}
