//
//  BinaryEncoderBuffer.swift
//  Dense
//
//  Created by Vitali Kurlovich on 3/16/20.
//

import CoreFoundation
import Foundation

internal
final class BinaryEncoderBuffer {
    typealias Error = BinaryEncoder.Error

    internal var data: [UInt8] = []

    init(_ minimumCapacity: Int) {
        data.reserveCapacity(minimumCapacity)
    }

    public
    func removeAll() {
        data.removeAll(keepingCapacity: true)
    }

    func appendBytes<T>(of: T) {
        var target = of
        withUnsafeBytes(of: &target) {
            data.append(contentsOf: $0)
        }
    }
}
