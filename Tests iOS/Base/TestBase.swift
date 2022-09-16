//
//  UITestBase.swift
//  Tests iOS
//
//  Created by Pavlov, Ilia on 4/1/22.
//

import Foundation
import XCTest

class TestBase: XCTestCase {
    let app: XCUIApplication = .init()
    let testCase: XCTestCase = .init()

    // Screens Initializer
    lazy var mainView: MainView = .init(app: app, testCase: testCase)
    lazy var demoView: DemoView = .init(app: app, testCase: testCase)
    
    // MARK: Override setUp/tearDown for test classes
//    override class func setUp() { }
//    override class func tearDown() { }
    
    // MARK: Override setUp/tearDown for test cases
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false // can be `true/false` softAssertions and hard
        app.launch()
        super.setUp()
    }
    
    override func tearDownWithError() throws {
        app.terminate()
    }
}
