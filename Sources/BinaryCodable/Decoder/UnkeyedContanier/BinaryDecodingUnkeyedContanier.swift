//
//  BinaryDecodingUnkeyedContanier.swift
//  BinaryCodable
//
//  Created by Vitali Kurlovich on 3/17/20.
//

import Foundation

public
struct BinaryDecodingUnkeyedContanier: UnkeyedDecodingContainer {
    typealias Error = BinaryDecoder.Error

    internal let decoder: BinaryDecoder

    internal var buffer: BinaryDecoderBuffer {
        decoder.decoderBuffer
    }

    public var codingPath: [CodingKey] { [] }

    public var count: Int? {
        buffer.size
    }

    public var isAtEnd: Bool {
        buffer.offset == buffer.size - 1
    }

    public var currentIndex: Int {
        buffer.offset
    }

    public mutating func nestedContainer<NestedKey>(keyedBy type: NestedKey.Type) throws -> KeyedDecodingContainer<NestedKey> where NestedKey: CodingKey {
        try decoder.container(keyedBy: type)
    }

    public mutating func nestedUnkeyedContainer() throws -> UnkeyedDecodingContainer {
        self
    }

    public mutating func superDecoder() throws -> Decoder {
        decoder
    }
}
