//
//  BinaryEncodingUnkeyedContanier+Encode.swift
//  BinaryCodable
//
//  Created by Vitali Kurlovich on 3/17/20.
//

import Foundation

extension BinaryEncodingUnkeyedContanier {
    public mutating
    func encode<T>(_ value: T) throws where T: Encodable & Sequence {
        try encoderBuffer.encode(value)
    }

    public mutating
    func encode<T>(_ value: T) throws where T: Encodable {
        try encoderBuffer.encode(value)
    }

    public mutating
    func encode(_ value: String) throws {
        try encoderBuffer.encode(value)
    }

    public mutating
    func encode(_ value: Double) throws {
        encoderBuffer.encode(value)
    }

    public mutating
    func encode(_ value: Float) throws {
        encoderBuffer.encode(value)
    }

    public mutating
    func encode(_ value: Int) throws {
        encoderBuffer.encode(value)
    }

    public mutating
    func encode(_ value: Int8) throws {
        encoderBuffer.encode(value)
    }

    public mutating
    func encode(_ value: Int16) throws {
        encoderBuffer.encode(value)
    }

    public mutating
    func encode(_ value: Int32) throws {
        encoderBuffer.encode(value)
    }

    public mutating
    func encode(_ value: Int64) throws {
        encoderBuffer.encode(value)
    }

    public mutating
    func encode(_ value: UInt) throws {
        encoderBuffer.encode(value)
    }

    public mutating
    func encode(_ value: UInt8) throws {
        encoderBuffer.encode(value)
    }

    public mutating
    func encode(_ value: UInt16) throws {
        encoderBuffer.encode(value)
    }

    public mutating
    func encode(_ value: UInt32) throws {
        encoderBuffer.encode(value)
    }

    public mutating
    func encode(_ value: UInt64) throws {
        encoderBuffer.encode(value)
    }

    public mutating
    func encode(_ value: Bool) throws {
        encoderBuffer.encode(value)
    }
}
