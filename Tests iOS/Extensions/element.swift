//
//  element.swift
//  Tests iOS
//
//  Created by Pavlov, Ilia on 9/15/22.
//

import XCTest

extension XCUIElement {
    /// - Returns: `true/false` if animal here
    func isItHere() -> Bool {
        self.exists
    }
    
    private func isItHasALegs() -> Bool {
        // let's assume we checking if animal has a legs
        // and return true/false
        self.exists
    }
    
    func jump() {
        self.isItHasALegs() ? jump() : print("Not sure if it possible")
    }
    
    func shouldBeHere(letsWaitABit: TimeInterval = 5.0) {
        XCTAssertTrue(self.waitForExistence(timeout: letsWaitABit), "Nah it's not here")
    }
}
