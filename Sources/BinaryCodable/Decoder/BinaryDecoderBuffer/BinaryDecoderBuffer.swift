//
//  BinaryDecoderBuffer.swift
//  BinaryCodable
//
//  Created by Vitali Kurlovich on 3/17/20.
//

import Foundation

internal
final class BinaryDecoderBuffer {
    typealias Error = BinaryDecoder.Error

    private let data: [UInt8]
    private(set) var offset: Int = 0

    init(_ data: [UInt8] = []) {
        self.data = data
    }

    init(_ data: Data) {
        self.data = [UInt8](data)
    }

//    internal
//    func removeAll() {
//        data.removeAll(keepingCapacity: true)
//    }
}

extension BinaryDecoderBuffer {
    static let zero = BinaryDecoderBuffer()
}

extension BinaryDecoderBuffer {
    func read<T>(into: inout T) throws {
        try read(MemoryLayout<T>.size, into: &into)
    }

    private
    func read(_ byteCount: Int, into: UnsafeMutableRawPointer) throws {
        if offset + byteCount > data.count {
            throw Error.prematureEndOfData
        }

        data.withUnsafeBytes {
            let from = $0.baseAddress! + offset
            memcpy(into, from, byteCount)
        }

        offset += byteCount
    }
}
