//
//  BinaryCodableDenseTests.swift
//  BinaryCodableTests
//
//  Created by Vitali Kurlovich on 4/1/20.
//

import XCTest
@testable import BinaryCodable
import Dense

class BinaryCodableDenseTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let array = [3, 6, 7, 8, 54]
        let test = DenseArray(array)
        
        let encoder = BinaryEncoder()
        let decoder = BinaryDecoder()

        XCTAssertNoThrow(try encoder.encode(test))
        guard let data = try? encoder.encode(test) else {
            return
        }

        XCTAssertNoThrow(try decoder.decode(DenseArray<Int>.self, from: data))
        guard let value = try? decoder.decode(DenseArray<Int>.self, from: data) else {
            return
        }
        XCTAssertEqual(test, value)

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
