//
//   BinaryDecodingUnkeyedContanier+Decode.swift
//  BinaryCodable
//
//  Created by Vitali Kurlovich on 3/17/20.
//

import Foundation

extension BinaryDecodingUnkeyedContanier {
    public mutating func decodeNil() throws -> Bool {
        throw Error.typeNotSupported
    }

    public mutating func decode(_: Bool.Type) throws -> Bool {
        try buffer.decode()
    }

    public mutating func decode(_: String.Type) throws -> String {
        try buffer.decode()
    }

    public mutating func decode(_: Double.Type) throws -> Double {
        try buffer.decode()
    }

    public mutating func decode(_: Float.Type) throws -> Float {
        try buffer.decode()
    }

    public mutating func decode(_: Int.Type) throws -> Int {
        try buffer.decode()
    }

    public mutating func decode(_: Int8.Type) throws -> Int8 {
        try buffer.decode()
    }

    public mutating func decode(_: Int16.Type) throws -> Int16 {
        try buffer.decode()
    }

    public mutating func decode(_: Int32.Type) throws -> Int32 {
        try buffer.decode()
    }

    public mutating func decode(_: Int64.Type) throws -> Int64 {
        try buffer.decode()
    }

    public mutating func decode(_: UInt.Type) throws -> UInt {
        try buffer.decode()
    }

    public mutating func decode(_: UInt8.Type) throws -> UInt8 {
        try buffer.decode()
    }

    public mutating func decode(_: UInt16.Type) throws -> UInt16 {
        try buffer.decode()
    }

    public mutating func decode(_: UInt32.Type) throws -> UInt32 {
        try buffer.decode()
    }

    public mutating func decode(_: UInt64.Type) throws -> UInt64 {
        try buffer.decode()
    }

    public mutating func decode<T>(_: T.Type) throws -> T where T: Decodable {
        try buffer.decode()
    }

    func decode<S: Sequence, T: Decodable>(_: S.Type) throws -> [T] where S.Element == T {
        throw BinaryDecoder.Error.typeNotSupported
        /// try decodeArray()
    }
}
