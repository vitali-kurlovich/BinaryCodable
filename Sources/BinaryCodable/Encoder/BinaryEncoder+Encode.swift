//
//  BinaryEncoder+Encode.swift
//  BinaryCodable
//
//  Created by Vitali Kurlovich on 3/19/20.
//

import Foundation

extension BinaryEncoder {
    public func encode<T>(_ value: T) throws -> Data where T: Encodable {
        encoderBuffer.removeAll()
        try value.encode(to: self)
        defer {
            encoderBuffer.removeAll()
        }
        return Data(encoderBuffer.data)
    }
}
