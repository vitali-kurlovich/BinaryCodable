//
//  BinaryEncoder.swift
//  Dense
//
//  Created by Vitali Kurlovich on 3/16/20.
//

import Foundation

public
protocol BinaryEncoded {}

public
final class BinaryEncoder: Encoder {
    internal let encoderBuffer: BinaryEncoderBuffer

    public
    init(_ minimumCapacity: Int = 8) {
        encoderBuffer = BinaryEncoderBuffer(minimumCapacity)
    }

    public func encode<T>(_ value: T) throws -> Data where T: Encodable {
        encoderBuffer.removeAll()
        try value.encode(to: self)
        defer {
            encoderBuffer.removeAll()
        }
        return Data(encoderBuffer.data)
    }

    public var codingPath: [CodingKey] { [] }

    public var userInfo: [CodingUserInfoKey: Any] { [:] }

    public func container<Key>(keyedBy _: Key.Type) -> KeyedEncodingContainer<Key> where Key: CodingKey {
        KeyedEncodingContainer(BinaryKeyedEncodingContainer<Key>(encoder: self))
    }

    public func unkeyedContainer() -> UnkeyedEncodingContainer {
        BinaryEncodingUnkeyedContanier(encoder: self)
    }

    public func singleValueContainer() -> SingleValueEncodingContainer {
        BinaryEncodingUnkeyedContanier(encoder: self)
    }
}

public
extension BinaryEncoder {
    /// All errors which `BinaryEncoder` itself can throw.
    enum Error: Swift.Error {
        case typeNotSupported

        case keyedEncodingNotSupported

        /// Attempted to encode a type which is `Encodable`, but not `BinaryEncodable`. (We
        /// require `BinaryEncodable` because `BinaryEncoder` doesn't support full keyed
        /// coding functionality.)
        case typeNotConformingToBinaryEncodable(Encodable.Type)

        /// Attempted to encode a type which is not `Encodable`.
        case typeNotConformingToEncodable(Any.Type)
    }
}
