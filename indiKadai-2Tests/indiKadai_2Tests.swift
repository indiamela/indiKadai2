//
//  indiKadai_2Tests.swift
//  indiKadai-2Tests
//
//  Created by Taishi Kusunose on 2021/11/21.
//

import XCTest
@testable import indiKadai_2

class indiKadai_2Tests: XCTestCase {
    let viewController = ViewController()
    
    func testPlus() throws {
        viewController.calcOption = .plus
        let result = viewController.calcOption.calclate(with: 1, 2)
        XCTAssertEqual(result, "3.0")
    }
    
    func testMinus() throws {
        viewController.calcOption = .minus
        let result = viewController.calcOption.calclate(with: 1, 2)
        XCTAssertEqual(result, "-1.0")
    }
    
    func testMultiple() throws {
        viewController.calcOption = .multiple
        let result = viewController.calcOption.calclate(with: 1, 2)
        XCTAssertEqual(result, "2.0")
    }
    
    func testDivision_Success() throws {
        viewController.calcOption = .division
        let result = viewController.calcOption.calclate(with: 1, 2)
        XCTAssertEqual(result, "0.5")
    }
    
    func testDivision_Error() throws {
        viewController.calcOption = .division
        let result = viewController.calcOption.calclate(with: 1, 0)
        XCTAssertNotEqual(result, "0")
        XCTAssertEqual(result, "割る数には0以外を入力してください")
    }
}
