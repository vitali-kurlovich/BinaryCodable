@testable import BinaryCodable
import XCTest

final class BinaryCodableTests: XCTestCase {
    func testEncodingBaseTypes() {
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

    func testEncodingEncadable() {
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

    func testEncodingBaseSequence() {
        let test = TestSequenceStructure(int: [-8, -2_134_500_031, 145_678_933, 4],
                                         uint: [8, 2_134_500_031, 145_678_933, 4],
                                         int8: [-56, 4, 127, -123],
                                         uint8: [56, 4, 119, 123],
                                         int16: [-31356, 25665, 3, 5432],
                                         uint16: [41356, 25665, 356, 15432],
                                         int32: [-1_405_543_345, 676, 334_567_765, -5_678_765],
                                         uint32: [1_405_543_345, 676, 4_234_567_765, 15_678_765],
                                         int64: [-1_400_555_543_340_995, 1676, 334_568_897_765, -5_667_866_678_765],
                                         uint64: [561_400_555_543_340_995, 1676, 889_334_568_897_765, 35_667_866_678_765], bool: [true, false, false, true, true, false],
                                         float: [-1.46337, 223.4567, 54.567654, -237.467],
                                         double: [-1.466765337, 456_223.4567, 5434.56765554, -256_737.467])

        let encoder = BinaryEncoder()
        let decoder = BinaryDecoder()

        XCTAssertNoThrow(try encoder.encode(test))
        guard let data = try? encoder.encode(test) else {
            return
        }

        XCTAssertNoThrow(try decoder.decode(TestSequenceStructure.self, from: data))
        guard let value = try? decoder.decode(TestSequenceStructure.self, from: data) else {
            return
        }
        XCTAssertEqual(test, value)
    }

    func testEncodingStringTypes() {
        let test = TestStringStructure(string1: "Hello world", string2: "")

        let encoder = BinaryEncoder()
        let decoder = BinaryDecoder()

        XCTAssertNoThrow(try encoder.encode(test))
        guard let data = try? encoder.encode(test) else {
            return
        }

        XCTAssertNoThrow(try decoder.decode(TestStringStructure.self, from: data))
        guard let value = try? decoder.decode(TestStringStructure.self, from: data) else {
            return
        }
        XCTAssertEqual(test, value)
    }

    func testEncodingStringTypes_1() {
        let test = TestStringStructure(string1: "Rōmaji", string2: "김")

        let encoder = BinaryEncoder()
        let decoder = BinaryDecoder()

        XCTAssertNoThrow(try encoder.encode(test))
        guard let data = try? encoder.encode(test) else {
            return
        }

        XCTAssertNoThrow(try decoder.decode(TestStringStructure.self, from: data))
        guard let value = try? decoder.decode(TestStringStructure.self, from: data) else {
            return
        }
        XCTAssertEqual(test, value)
    }

    func testEncodingStringTypes_2() {
        let test = TestStringStructure(string1: "Cafe\u{301} du 🌍", string2: "🇵🇷")

        let encoder = BinaryEncoder()
        let decoder = BinaryDecoder()

        XCTAssertNoThrow(try encoder.encode(test))
        guard let data = try? encoder.encode(test) else {
            return
        }

        XCTAssertNoThrow(try decoder.decode(TestStringStructure.self, from: data))
        guard let value = try? decoder.decode(TestStringStructure.self, from: data) else {
            return
        }
        XCTAssertEqual(test, value)
    }

    static var allTests = [
        ("testEncodingBaseTypes", testEncodingBaseTypes),
        ("testEncodingEncadable", testEncodingEncadable),
        ("testEncodingBaseSequence", testEncodingBaseSequence),
        ("testEncodingStringTypes", testEncodingStringTypes),
        ("testEncodingStringTypes_1", testEncodingStringTypes_1),
        ("testEncodingStringTypes_2", testEncodingStringTypes_2),
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

struct TestSequenceStructure: Equatable {
    let int: [Int]
    let uint: [UInt]

    let int8: [Int8]
    let uint8: [UInt8]

    let int16: [Int16]
    let uint16: [UInt16]

    let int32: [Int32]
    let uint32: [UInt32]

    let int64: [Int64]
    let uint64: [UInt64]

    let bool: [Bool]

    let float: [Float]
    let double: [Double]
}

extension TestSequenceStructure: Codable {
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

        try container.encode(bool)

        try container.encode(float)
        try container.encode(double)
    }

    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()

        int = try container.decode([Int].self)
        uint = try container.decode([UInt].self)

        int8 = try container.decode([Int8].self)
        uint8 = try container.decode([UInt8].self)

        int16 = try container.decode([Int16].self)
        uint16 = try container.decode([UInt16].self)

        int32 = try container.decode([Int32].self)
        uint32 = try container.decode([UInt32].self)

        int64 = try container.decode([Int64].self)
        uint64 = try container.decode([UInt64].self)

        bool = try container.decode([Bool].self)

        float = try container.decode([Float].self)
        double = try container.decode([Double].self)
    }
}

struct TestStringStructure: Equatable {
    let string1: String
    let string2: String
}

extension TestStringStructure: Codable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()

        try container.encode(string1)
        try container.encode(string2)
    }

    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()

        string1 = try container.decode(String.self)
        string2 = try container.decode(String.self)
    }
}
