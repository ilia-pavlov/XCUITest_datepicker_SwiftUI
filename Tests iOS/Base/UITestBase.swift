//
//  UITestBase.swift
//  Tests iOS
//
//  Created by Pavlov, Ilia on 4/1/22.
//

import Foundation
import XCTest

class UITestBase: XCTestCase {
    let app: XCUIApplication = XCUIApplication()
    let testCase: XCTestCase = XCTestCase()

    // Screens Initializer
    lazy var hub: Hub = Hub(app: app, testCase: testCase)
    
    override func setUp() {
        continueAfterFailure = false
        
        app.launch()
        super.setUp()
    }
    
    override func tearDownWithError() throws {
        app.terminate()
    }
}
