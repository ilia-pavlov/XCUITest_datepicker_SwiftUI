//
//  DemoView.swift
//  Tests iOS
//
//  Created by Pavlov, Ilia on 9/15/22.
//

import Foundation
import XCTest

class DemoView: ScreenBase {
    // Elements - Animals
    lazy var dog: XCUIElement = app.staticTexts["Dog"]
    lazy var whale: XCUIElement = app.staticTexts["Whale"]
    
    // Functions, can be Given, When, Then
    // MARK: - Then
    func thenAnimalJumping() {
        dog.jump()
        whale.jump()
    }
    
    // MARK: - When
    func whenICallYou() {
        dog.shouldBeHere(letsWaitABit: 7)
        whale.shouldBeHere()
    }
}
