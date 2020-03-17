//
//   BinaryDecodingUnkeyedContanier+Decode.swift
//  BinaryCodable
//
//  Created by Vitali Kurlovich on 3/17/20.
//

import Foundation

// BinaryDecodingUnkeyedContanier+Decode
extension BinaryDecodingUnkeyedContanier {
    public mutating func decodeNil() throws -> Bool {
        throw Error.typeNotSupported
    }

    public mutating func decode(_: Bool.Type) throws -> Bool {
        throw Error.typeNotSupported
    }

    public mutating func decode(_: String.Type) throws -> String {
        throw Error.typeNotSupported
    }

    public mutating func decode(_: Double.Type) throws -> Double {
        throw Error.typeNotSupported
    }

    public mutating func decode(_: Float.Type) throws -> Float {
        throw Error.typeNotSupported
    }

    public mutating func decode(_: Int.Type) throws -> Int {
        throw Error.typeNotSupported
    }

    public mutating func decode(_: Int8.Type) throws -> Int8 {
        throw Error.typeNotSupported
    }

    public mutating func decode(_: Int16.Type) throws -> Int16 {
        throw Error.typeNotSupported
    }

    public mutating func decode(_: Int32.Type) throws -> Int32 {
        throw Error.typeNotSupported
    }

    public mutating func decode(_: Int64.Type) throws -> Int64 {
        throw Error.typeNotSupported
    }

    public mutating func decode(_: UInt.Type) throws -> UInt {
        throw Error.typeNotSupported
    }

    public mutating func decode(_: UInt8.Type) throws -> UInt8 {
        throw Error.typeNotSupported
    }

    public mutating func decode(_: UInt16.Type) throws -> UInt16 {
        throw Error.typeNotSupported
    }

    public mutating func decode(_: UInt32.Type) throws -> UInt32 {
        throw Error.typeNotSupported
    }

    public mutating func decode(_: UInt64.Type) throws -> UInt64 {
        throw Error.typeNotSupported
    }

    public mutating func decode<T>(_: T.Type) throws -> T where T: Decodable {
        throw Error.typeNotSupported
    }
}
