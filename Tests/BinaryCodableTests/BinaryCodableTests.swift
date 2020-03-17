@testable import BinaryCodable
import XCTest

final class BinaryCodableTests: XCTestCase {
    func testEncoding() {
        let test = TestStructure(int8: -71, uint8: 113,
                                 int16: -14322, uint16: 47653,
                                 int32: -59_933_334, uint32: 8_433_223,
                                 int64: -3_447_763_565_433, uint64: 9_494_932_234)

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

    static var allTests = [
        ("testEncoding", testEncoding),
    ]
}

struct TestStructure: Equatable {
    let int8: Int8
    let uint8: UInt8

    let int16: Int16
    let uint16: UInt16

    let int32: Int32
    let uint32: UInt32

    let int64: Int64
    let uint64: UInt64
}

extension TestStructure: Codable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        try container.encode(int8)
        try container.encode(uint8)

        try container.encode(int16)
        try container.encode(uint16)

        try container.encode(int32)
        try container.encode(uint32)

        try container.encode(int64)
        try container.encode(uint64)
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        int8 = try container.decode(Int8.self)
        uint8 = try container.decode(UInt8.self)

        int16 = try container.decode(Int16.self)
        uint16 = try container.decode(UInt16.self)

        int32 = try container.decode(Int32.self)
        uint32 = try container.decode(UInt32.self)

        int64 = try container.decode(Int64.self)
        uint64 = try container.decode(UInt64.self)
    }
}
