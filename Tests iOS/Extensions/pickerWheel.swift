//
//  pickerWheel.swift
//  Tests iOS
//
//  Created by Pavlov, Ilia on 3/30/22.
//

import Foundation
import XCTest


extension XCUIElement {
    
func currentPosition() -> String {
    self.value as? String ?? "Error: return value as nil"
}
    
func rotateUp() {
    let x = self.frame.width / 2.0
    let y = self.frame.height / 2.0
    // each wheel notch is about 30px high, so tapping y - 20 rotates up. y + 20 rotates down.
    let offset: CGFloat = -20.0
    let wheelParameters = self.coordinate(withNormalizedOffset: .zero).withOffset(CGVector(dx: x, dy: y + offset))
    wheelParameters.tap()
    }
}

