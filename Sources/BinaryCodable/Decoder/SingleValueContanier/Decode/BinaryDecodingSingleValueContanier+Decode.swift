//
//  BinaryDecodingSingleValueContanier+Decode.swift
//  BinaryCodable
//
//  Created by Vitali Kurlovich on 3/17/20.
//

import Foundation

extension BinaryDecodingSingleValueContanier {
    public func decodeNil() -> Bool {
        // throw Error.typeNotSupported
        false
    }

    public func decode(_: Bool.Type) throws -> Bool {
        throw Error.typeNotSupported
    }

    public func decode(_: String.Type) throws -> String {
        throw Error.typeNotSupported
    }

    public func decode(_: Double.Type) throws -> Double {
        throw Error.typeNotSupported
    }

    public func decode(_: Float.Type) throws -> Float {
        throw Error.typeNotSupported
    }

    public func decode(_: Int.Type) throws -> Int {
        // decoder.decode(type, from: <#T##Data#>)
        throw Error.typeNotSupported
    }

    public func decode(_: UInt.Type) throws -> UInt {
        throw Error.typeNotSupported
    }

    public func decode(_: Int8.Type) throws -> Int8 {
        let value: Int8 = try buffer.decode()
        return value
    }

    public func decode(_: UInt8.Type) throws -> UInt8 {
        let value: UInt8 = try buffer.decode()
        return value
    }

    public func decode(_: Int16.Type) throws -> Int16 {
        let value: Int16 = try buffer.decode()
        return value
    }

    public func decode(_: UInt16.Type) throws -> UInt16 {
        let value: UInt16 = try buffer.decode()
        return value
    }

    public func decode(_: Int32.Type) throws -> Int32 {
        let value: Int32 = try buffer.decode()
        return value
    }

    public func decode(_: UInt32.Type) throws -> UInt32 {
        let value: UInt32 = try buffer.decode()
        return value
    }

    public func decode(_: Int64.Type) throws -> Int64 {
        let value: Int64 = try buffer.decode()
        return value
    }

    public func decode(_: UInt64.Type) throws -> UInt64 {
        let value: UInt64 = try buffer.decode()
        return value
    }

    public func decode<T>(_: T.Type) throws -> T where T: Decodable {
        throw Error.typeNotSupported
    }
}
