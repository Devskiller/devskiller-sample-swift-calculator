//
//  CalculatorTests.swift
//  CalculatorTests
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {

    var calc: Calculator!

    override func setUpWithError() throws {
        calc = Calculator()
    }

    override func tearDownWithError() throws {
        calc = nil
    }

    func testAdd() {
        let result = calc.add(x: 2, y: 2)
        XCTAssertEqual(result, 4)
    }

    func testSubtract() {
        let result = calc.substract(x: 4, y: 2)
        XCTAssertEqual(result, 2)
    }

    func testMultiply() {
        let result = calc.multiply(x: 4, y: 2)
        XCTAssertEqual(result, 8)
    }

    func testDivide() {
        let result = try? calc.divide(x: 4, y: 2)
        XCTAssertEqual(result, 2)
    }
}
