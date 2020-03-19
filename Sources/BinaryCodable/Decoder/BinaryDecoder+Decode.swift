//
//  BinaryDecoder+Decode.swift
//  BinaryCodable
//
//  Created by Vitali Kurlovich on 3/19/20.
//

import Foundation

extension BinaryDecoder {
    func decode<T>(_: T.Type, from: Data) throws -> T where T: Decodable {
        decoderBuffer = BinaryDecoderBuffer(from)
        defer {
            self.decoderBuffer = BinaryDecoderBuffer.zero
        }
        return try T(from: self)
    }
}
