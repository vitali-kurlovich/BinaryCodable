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

    internal var encoderBuffer: BinaryEncoderBuffer {
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
