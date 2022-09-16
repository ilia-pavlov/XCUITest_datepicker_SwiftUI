//
//  File.swift
//  Tests iOS
//
//  Created by Pavlov, Ilia on 9/15/22.
//

import Foundation
public protocol Aids {
    var rawValue: String { get }
}

public enum DemoAid: String, Aids {

  // Aids
    case pickerWheel1
    case pickerWheel2

}



public extension Aids where Self == DemoAid {
    static var demoAid: DemoAid.Type {
        DemoAid.self
    }
}
