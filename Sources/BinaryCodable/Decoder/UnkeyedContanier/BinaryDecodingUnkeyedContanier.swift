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

    public var codingPath: [CodingKey] { [] }

    public var count: Int?

    public var isAtEnd: Bool = false

    public var currentIndex: Int { 0 }

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
