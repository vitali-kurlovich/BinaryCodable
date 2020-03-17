//
//  BinaryEncoderBuffer+BinaryEncoded.swift
//  BinaryCodable
//
//  Created by Vitali Kurlovich on 3/17/20.
//

import Foundation

private let binaryEncoder = BinaryEncoder()

extension BinaryEncoderBuffer {
    func encodeBinaryEncoded<T: Encodable>(_ value: T) throws {
        let data = try binaryEncoder.encode(value)
        encode(data)
    }
}
