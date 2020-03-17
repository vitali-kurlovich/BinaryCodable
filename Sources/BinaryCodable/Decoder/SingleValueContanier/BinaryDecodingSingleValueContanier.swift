//
//  BinaryDecodingUnkeyedContanier+SingleValueDecodingContainer.swift
//  BinaryCodable
//
//  Created by Vitali Kurlovich on 3/17/20.
//

import Foundation

public
struct BinaryDecodingSingleValueContanier: SingleValueDecodingContainer {
    internal let decoder: BinaryDecoder

    public var codingPath: [CodingKey] { [] }

    typealias Error = BinaryDecoder.Error
}
