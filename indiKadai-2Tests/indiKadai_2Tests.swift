//
//  indiKadai_2Tests.swift
//  indiKadai-2Tests
//
//  Created by Taishi Kusunose on 2021/11/21.
//

import XCTest
@testable import indiKadai_2

class indiKadai_2Tests: XCTestCase {
    
    func testPlus() throws {
        let result = try! CalculationOption.plus.calclate(with: 1, 2)
        XCTAssertEqual(result, 3.0)
    }
    
    func testMinus() throws {
        let result = try! CalculationOption.minus.calclate(with: 1, 2)
        XCTAssertEqual(result, -1.0)
    }
    
    func testMultiple() throws {
        let result = try! CalculationOption.multiple.calclate(with: 1, 2)
        XCTAssertEqual(result, 2.0)
    }
    
    func testDivision_Success() throws {
        let result = try! CalculationOption.division.calclate(with: 1, 2)
        XCTAssertEqual(result, 0.5)
    }
    
    func testDivision_Error() throws {
        XCTAssertThrowsError(
            try CalculationOption.division.calclate(with: 1, 0),
            "divisorIsZero",
            { error in
                XCTAssertEqual(
                    error as? CalculationOption.Error,
                    CalculationOption.Error.divisorIsZero
                )
            }
        )
    }
}
