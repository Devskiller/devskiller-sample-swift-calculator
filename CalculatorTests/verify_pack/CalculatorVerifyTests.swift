//
//  CalculatorVerifyTests.swift
//  CalculatorTests
//

import XCTest
@testable import Calculator

class CalculatorVerifyTests: XCTestCase {

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

    func testSubstract() {
        let result = calc.substract(x: 4, y: 2)
        XCTAssertEqual(result, 2)
    }

    func testMultiply() {
        let result = calc.multiply(x: 4, y: 2)
        XCTAssertEqual(result, 8)
    }

    func testMultiplyZero() {
        let result = calc.multiply(x: 4, y: 0)
        XCTAssertEqual(result, 0)
    }

    func testDivide() {
        let result = try? calc.divide(x: 4, y: 2)
        XCTAssertEqual(result, 2)
    }

    func testDivideByZero() {
        XCTAssertThrowsError(try calc.divide(x: 4, y: 0)) { error in
            XCTAssertEqual(error as! CalculatorError, CalculatorError.divisionByZero)
        }
    }
}


