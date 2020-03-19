//
//  BinaryEncoderBuffer+Sequence.swift
//  BinaryCodable
//
//  Created by Vitali Kurlovich on 3/17/20.
//

import Foundation

extension BinaryEncoderBuffer {
    private func size<T: Sequence>(_ sequence: T) -> UInt32 {
        var count: UInt32 = 0
        for _ in sequence {
            count += 1
        }
        return count
    }

    func encode<T>(contentsOf sequence: T) where T: Sequence, T.Element == Int8 {
        let count = size(sequence)

        data.reserveCapacity(MemoryLayout.size(ofValue: count) + Int(count))
        encode(count)
        sequence.forEach { encode($0) }
        // data.append(contentsOf: sequence)
    }

    func encode<T>(contentsOf sequence: T) where T: Sequence, T.Element == UInt8 {
        let count = size(sequence)

        data.reserveCapacity(MemoryLayout.size(ofValue: count) + Int(count))
        encode(count)
        data.append(contentsOf: sequence)
    }

    func encode<T>(contentsOf sequence: T) where T: Sequence, T.Element == Bool {
        let count = size(sequence)

        data.reserveCapacity(MemoryLayout.size(ofValue: count) + Int(count))
        encode(count)

        sequence.forEach { encode($0) }
    }

    func encode<T>(contentsOf sequence: T) where T: Sequence, T.Element == Int {
        let count = size(sequence)

        data.reserveCapacity(MemoryLayout.size(ofValue: count) + MemoryLayout<T.Element>.size * Int(count))
        encode(count)

        sequence.forEach { encode($0) }
    }

    func encode<T>(contentsOf sequence: T) where T: Sequence, T.Element == UInt {
        let count = size(sequence)

        data.reserveCapacity(MemoryLayout.size(ofValue: count) + MemoryLayout<T.Element>.size * Int(count))
        encode(count)

        sequence.forEach { encode($0) }
    }

    func encode<T>(contentsOf sequence: T) where T: Sequence, T.Element == Int64 {
        let count = size(sequence)

        data.reserveCapacity(MemoryLayout.size(ofValue: count) + MemoryLayout<T.Element>.size * Int(count))
        encode(count)

        sequence.forEach { encode($0) }
    }

    func encode<T>(contentsOf sequence: T) where T: Sequence, T.Element == UInt64 {
        let count = size(sequence)

        data.reserveCapacity(MemoryLayout.size(ofValue: count) + MemoryLayout<T.Element>.size * Int(count))
        encode(count)

        sequence.forEach { encode($0) }
    }

    func encode<T>(contentsOf sequence: T) where T: Sequence, T.Element == Int32 {
        let count = size(sequence)

        data.reserveCapacity(MemoryLayout.size(ofValue: count) + MemoryLayout<T.Element>.size * Int(count))
        encode(count)

        sequence.forEach { encode($0) }
    }

    func encode<T>(contentsOf sequence: T) where T: Sequence, T.Element == UInt32 {
        let count = size(sequence)

        data.reserveCapacity(MemoryLayout.size(ofValue: count) + MemoryLayout<T.Element>.size * Int(count))
        encode(count)

        sequence.forEach { encode($0) }
    }

    func encode<T>(contentsOf sequence: T) where T: Sequence, T.Element == Int16 {
        let count = size(sequence)

        data.reserveCapacity(MemoryLayout.size(ofValue: count) + MemoryLayout<T.Element>.size * Int(count))
        encode(count)

        sequence.forEach { encode($0) }
    }

    func encode<T>(contentsOf sequence: T) where T: Sequence, T.Element == UInt16 {
        let count = size(sequence)

        data.reserveCapacity(MemoryLayout.size(ofValue: count) + MemoryLayout<T.Element>.size * Int(count))
        encode(count)

        sequence.forEach { encode($0) }
    }

    func encode<T>(contentsOf sequence: T) where T: Sequence, T.Element == Float {
        let count = size(sequence)

        data.reserveCapacity(MemoryLayout.size(ofValue: count) + MemoryLayout<T.Element>.size * Int(count))
        encode(count)

        sequence.forEach { encode($0) }
    }

    func encode<T>(contentsOf sequence: T) where T: Sequence, T.Element == Double {
        let count = size(sequence)

        data.reserveCapacity(MemoryLayout.size(ofValue: count) + MemoryLayout<T.Element>.size * Int(count))
        encode(count)

        sequence.forEach { encode($0) }
    }
}
