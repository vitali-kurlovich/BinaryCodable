//
//  BinaryKeyedDecodingContainer+Decode.swift
//  BinaryCodable
//
//  Created by Vitali Kurlovich on 3/17/20.
//

import Foundation

// BinaryKeyedDecodingContainer+Decode
extension BinaryKeyedDecodingContainer {
    typealias Error = BinaryDecoder.Error

    func decode(_: Bool.Type, forKey _: Key) throws -> Bool {
        throw Error.typeNotSupported
    }

    func decode(_: String.Type, forKey _: Key) throws -> String {
        throw Error.typeNotSupported
    }

    func decode(_: Double.Type, forKey _: Key) throws -> Double {
        throw Error.typeNotSupported
    }

    func decode(_: Float.Type, forKey _: Key) throws -> Float {
        throw Error.typeNotSupported
    }

    func decode(_: Int.Type, forKey _: Key) throws -> Int {
        throw Error.typeNotSupported
    }

    func decode(_: Int8.Type, forKey _: Key) throws -> Int8 {
        throw Error.typeNotSupported
    }

    func decode(_: Int16.Type, forKey _: Key) throws -> Int16 {
        throw Error.typeNotSupported
    }

    func decode(_: Int32.Type, forKey _: Key) throws -> Int32 {
        throw Error.typeNotSupported
    }

    func decode(_: Int64.Type, forKey _: Key) throws -> Int64 {
        throw Error.typeNotSupported
    }

    func decode(_: UInt.Type, forKey _: Key) throws -> UInt {
        throw Error.typeNotSupported
    }

    func decode(_: UInt8.Type, forKey _: Key) throws -> UInt8 {
        throw Error.typeNotSupported
    }

    func decode(_: UInt16.Type, forKey _: Key) throws -> UInt16 {
        throw Error.typeNotSupported
    }

    func decode(_: UInt32.Type, forKey _: Key) throws -> UInt32 {
        throw Error.typeNotSupported
    }

    func decode(_: UInt64.Type, forKey _: Key) throws -> UInt64 {
        throw Error.typeNotSupported
    }

    func decode<T>(_: T.Type, forKey _: Key) throws -> T where T: Decodable {
        throw Error.typeNotSupported
    }
}
