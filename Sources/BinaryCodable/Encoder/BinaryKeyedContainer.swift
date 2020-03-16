//
//  BinaryKeyedContainer.swift
//  Dense
//
//  Created by Vitali Kurlovich on 3/16/20.
//

import Foundation

internal
struct BinaryKeyedContainer<Key: CodingKey>: KeyedEncodingContainerProtocol {
    internal var encoder: BinaryEncoder

    private var encoderBuffer: BinaryEncoderBuffer {
        encoder.encoderBuffer
    }

    var codingPath: [CodingKey] { [] }

    func encode<T>(_ value: T, forKey _: Key) throws where T: Encodable {
        try encoderBuffer.encode(value)
    }

    func encodeNil(forKey _: Key) throws {}

    func nestedContainer<NestedKey>(keyedBy keyType: NestedKey.Type, forKey _: Key) -> KeyedEncodingContainer<NestedKey> where NestedKey: CodingKey {
        return encoder.container(keyedBy: keyType)
    }

    func nestedUnkeyedContainer(forKey _: Key) -> UnkeyedEncodingContainer {
        encoder.unkeyedContainer()
    }

    func superEncoder() -> Encoder {
        encoder
    }

    func superEncoder(forKey _: Key) -> Encoder {
        encoder
    }
}
