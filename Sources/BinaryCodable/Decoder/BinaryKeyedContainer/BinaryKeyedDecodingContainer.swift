//
//  BinaryKeyedDecodingContainer.swift
//  BinaryCodable
//
//  Created by Vitali Kurlovich on 3/17/20.
//

import Foundation

internal
struct BinaryKeyedDecodingContainer<Key: CodingKey>: KeyedDecodingContainerProtocol {
    internal let decoder: BinaryDecoder

    var codingPath: [CodingKey] { [] }

    var allKeys: [Key] { [] }

    func contains(_: Key) -> Bool {
        false
    }

    func decodeNil(forKey _: Key) throws -> Bool {
        throw Error.typeNotSupported
    }

    func nestedContainer<NestedKey>(keyedBy _: NestedKey.Type, forKey _: Key) throws -> KeyedDecodingContainer<NestedKey> where NestedKey: CodingKey {
        throw Error.typeNotSupported
    }

    func nestedUnkeyedContainer(forKey _: Key) throws -> UnkeyedDecodingContainer {
        throw Error.typeNotSupported
    }

    func superDecoder() throws -> Decoder {
        throw Error.typeNotSupported
    }

    func superDecoder(forKey _: Key) throws -> Decoder {
        throw Error.typeNotSupported
    }
}
