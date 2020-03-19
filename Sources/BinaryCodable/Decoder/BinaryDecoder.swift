//
//  BinaryDecoder.swift
//  BinaryCodable
//
//  Created by Vitali Kurlovich on 3/17/20.
//

import Foundation

public
protocol BinaryDecoded {}

public
final class BinaryDecoder: Decoder {
    internal var decoderBuffer = BinaryDecoderBuffer.zero

    public var codingPath: [CodingKey] { [] }

    public var userInfo: [CodingUserInfoKey: Any] { [:] }

    public func container<Key>(keyedBy _: Key.Type) throws -> KeyedDecodingContainer<Key> where Key: CodingKey {
        throw Error.keyedDecodingNotSupported
        // return KeyedDecodingContainer(BinaryKeyedDecodingContainer<Key>(decoder: self))
    }

    public func unkeyedContainer() throws -> UnkeyedDecodingContainer {
        BinaryDecodingUnkeyedContanier(decoder: self)
    }

    public func singleValueContainer() throws -> SingleValueDecodingContainer {
        BinaryDecodingSingleValueContanier(decoder: self)
    }
}

public
extension BinaryDecoder {
    /// All errors which `BinaryEncoder` itself can throw.
    enum Error: Swift.Error {
        case unknown
        case keyedDecodingNotSupported
        case typeNotSupported
        case prematureEndOfData
    }
}
