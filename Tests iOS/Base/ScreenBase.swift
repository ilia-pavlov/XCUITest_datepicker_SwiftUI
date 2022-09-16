//
//  UITestBase.swift
//  Tests iOS
//
//  Created by Pavlov, Ilia on 4/1/22.
//

import Foundation
import XCTest

class ScreenBase {
    var app: XCUIApplication
    var testCase: XCTestCase
    
    init(app: XCUIApplication, testCase: XCTestCase) {
        self.app = app
        self.testCase = testCase
    }
}
