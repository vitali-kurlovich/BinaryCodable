@testable import BinaryCodable
import XCTest

final class BinaryCodableTests: XCTestCase {
    func testEncoding() {
        let test = TestStructure(int: -8_706_503_005_435_567, uint: 849_900_345_677,
                                 int8: -71, uint8: 113,
                                 int16: -14322, uint16: 47653,
                                 int32: -59_933_334, uint32: 8_433_223,
                                 int64: -3_447_763_565_433, uint64: 9_494_932_234,
                                 boolTrue: true,
                                 boolFalse: false,
                                 float: -1.89478838,
                                 double: 76540.664344343)

        let encoder = BinaryEncoder()
        let decoder = BinaryDecoder()

        XCTAssertNoThrow(try encoder.encode(test))
        guard let data = try? encoder.encode(test) else {
            return
        }

        XCTAssertNoThrow(try decoder.decode(TestStructure.self, from: data))
        guard let value = try? decoder.decode(TestStructure.self, from: data) else {
            return
        }
        XCTAssertEqual(test, value)
    }

    func testEncoding1() {
        let field1 = TestStructure(int: -8_706_503_005_435_567, uint: 849_900_345_677,
                                   int8: -71, uint8: 113,
                                   int16: -14322, uint16: 47653,
                                   int32: -59_933_334, uint32: 8_433_223,
                                   int64: -3_447_763_565_433, uint64: 9_494_932_234,
                                   boolTrue: true,
                                   boolFalse: false,
                                   float: -1.89478838,
                                   double: 76540.664344343)

        let field2 = TestStructure(int: -1_706_503_005_222_567, uint: 1_849_900_345_677,
                                   int8: -111, uint8: 213,
                                   int16: -24322, uint16: 44653,
                                   int32: -159_933_334, uint32: 218_433_223,
                                   int64: -13_447_763_565_433, uint64: 59_494_932_234,
                                   boolTrue: false,
                                   boolFalse: true,
                                   float: -1.49478838,
                                   double: 26540.664344343)

        let test = TestBinaryCodableStructure(field1: field1, field2: field2)
        let encoder = BinaryEncoder()
        let decoder = BinaryDecoder()

        XCTAssertNoThrow(try encoder.encode(test))
        guard let data = try? encoder.encode(test) else {
            return
        }

        XCTAssertNoThrow(try decoder.decode(TestBinaryCodableStructure.self, from: data))
        guard let value = try? decoder.decode(TestBinaryCodableStructure.self, from: data) else {
            return
        }
        XCTAssertEqual(test, value)
    }

    static var allTests = [
        ("testEncoding", testEncoding),
    ]
}

struct TestStructure: Equatable {
    let int: Int
    let uint: UInt

    let int8: Int8
    let uint8: UInt8

    let int16: Int16
    let uint16: UInt16

    let int32: Int32
    let uint32: UInt32

    let int64: Int64
    let uint64: UInt64

    let boolTrue: Bool
    let boolFalse: Bool

    let float: Float
    let double: Double
}

struct TestBinaryCodableStructure: Equatable {
    let field1: TestStructure
    let field2: TestStructure
}

extension TestBinaryCodableStructure: Codable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        try container.encode(field1)
        try container.encode(field2)
    }

    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        field1 = try container.decode(TestStructure.self)
        field2 = try container.decode(TestStructure.self)
    }
}

extension TestStructure: Codable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()

        try container.encode(int)
        try container.encode(uint)

        try container.encode(int8)
        try container.encode(uint8)

        try container.encode(int16)
        try container.encode(uint16)

        try container.encode(int32)
        try container.encode(uint32)

        try container.encode(int64)
        try container.encode(uint64)

        try container.encode(boolTrue)
        try container.encode(boolFalse)

        try container.encode(float)
        try container.encode(double)
    }

    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()

        int = try container.decode(Int.self)
        uint = try container.decode(UInt.self)

        int8 = try container.decode(Int8.self)
        uint8 = try container.decode(UInt8.self)

        int16 = try container.decode(Int16.self)
        uint16 = try container.decode(UInt16.self)

        int32 = try container.decode(Int32.self)
        uint32 = try container.decode(UInt32.self)

        int64 = try container.decode(Int64.self)
        uint64 = try container.decode(UInt64.self)

        boolTrue = try container.decode(Bool.self)
        boolFalse = try container.decode(Bool.self)

        float = try container.decode(Float.self)
        double = try container.decode(Double.self)
    }
}
