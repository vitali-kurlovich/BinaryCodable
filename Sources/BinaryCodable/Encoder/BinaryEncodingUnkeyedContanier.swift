//
//  BinaryEncodingUnkeyedContanier.swift
//  Dense
//
//  Created by Vitali Kurlovich on 3/16/20.
//

import Foundation

public
struct BinaryEncodingUnkeyedContanier: UnkeyedEncodingContainer, SingleValueEncodingContainer {
    internal let encoder: BinaryEncoder

    private var encoderBuffer: BinaryEncoderBuffer {
        encoder.encoderBuffer
    }

    public var codingPath: [CodingKey] { [] }

    public var count: Int { 0 }

    public mutating
    func encodeNil() throws {}

    public mutating
    func nestedContainer<NestedKey>(keyedBy keyType: NestedKey.Type) -> KeyedEncodingContainer<NestedKey> where NestedKey: CodingKey {
        encoder.container(keyedBy: keyType)
    }

    public mutating
    func nestedUnkeyedContainer() -> UnkeyedEncodingContainer {
        self
    }

    public mutating
    func superEncoder() -> Encoder {
        encoder
    }
}

extension BinaryEncodingUnkeyedContanier {
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
    func encode<T>(_ value: T) throws where T: Encodable {
        if value is BinaryEncoded {
            try encodeBinaryEncoded(value)
            return
        }

        try encoderBuffer.encode(value)
    }

    public mutating
    func encode(_ value: Bool) throws {
        encoderBuffer.encode(value)
    }

    private mutating
    func encodeBinaryEncoded<T: Encodable>(_ value: T) throws {
        let encoder = BinaryEncoder()
        let data = try encoder.encode(value)
        encoderBuffer.encode(data)
    }
}
