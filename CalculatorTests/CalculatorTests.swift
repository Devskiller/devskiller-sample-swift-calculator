//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Illia on 3/26/18.
//  Copyright © 2018 Devskiller. All rights reserved.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {

    func testAdd() {
        let calc = Calculator()
        let result = calc.add(x: 2, y: 2)
        XCTAssertEqual(result, 4)
    }
    
    func testSubtract() {
        let calc = Calculator()
        let result = calc.substract(x: 4, y: 2)
        XCTAssertEqual(result, 2)
    }
    
    func testMultiply() {
        let calc = Calculator()
        let result = calc.multiply(x: 4, y: 2)
        XCTAssertEqual(result, 8)
    }
    
    func testDivide() {
        let calc = Calculator()
        let result = try? calc.divide(x: 4, y: 2)
        XCTAssertEqual(result, 2)
    }
}
