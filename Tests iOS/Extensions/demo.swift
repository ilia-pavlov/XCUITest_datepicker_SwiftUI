//
//  demo.swift
//  Tests iOS
//
//  Created by Pavlov, Ilia on 9/15/22.
//

import XCTest

extension XCUIElement {
    // MARK: Custom functions
    /**
     Rotate picker wheel to given value.
     Custom solution for unsupported pickerWheels.adjust(toPickerWheelValue: "")
     - Parameters:
        - value: input data in String format as expected value
    - assuming 100 wheel's iteration is MAX,
     - secureRotateCount will break loop after 100 iterations
     */
    func adjustPickerWheelTo(value: String) {
        let expectedValue: XCUIElement = XCUIApplication().pickerWheels[value]
        var secureRotateCount: Int = 0
        XCTContext.runActivity(named: "Adjusting picker wheel \(self) to \(value)") { _ in
            while !expectedValue.waitForExistence(timeout: 1) {
                self.rotateUp()
                secureRotateCount += 1
                if secureRotateCount == 100 {
                    XCTFail("""
                Adjustment FAIL to set \(value),
                    Secure rotate count break adjustment,
                        picker wheel set to \(self.currentState())
            """)
                }
            }
        }
    }
    
    func currentState() -> String {
        self.value as? String ?? "Error: return value as nil"
    }
}
