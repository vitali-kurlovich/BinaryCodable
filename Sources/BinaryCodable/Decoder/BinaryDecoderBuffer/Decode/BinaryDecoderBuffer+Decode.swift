//
//  BinaryDecoderBuffer+Decode.swift
//  BinaryCodable
//
//  Created by Vitali Kurlovich on 3/17/20.
//

import CoreFoundation
import Foundation

extension BinaryDecoderBuffer {
    private
    func decodeFixedWidthInteger<T: FixedWidthInteger>() throws -> T {
        var v = T()
        try read(into: &v)
        return T(littleEndian: v)
    }

    func decode() throws -> Int8 {
        try decodeFixedWidthInteger()
    }

    func decode() throws -> UInt8 {
        try decodeFixedWidthInteger()
    }

    public func decode() throws -> Int16 {
        try decodeFixedWidthInteger()
    }

    public func decode() throws -> UInt16 {
        try decodeFixedWidthInteger()
    }

    public func decode() throws -> Int32 {
        try decodeFixedWidthInteger()
    }

    public func decode() throws -> UInt32 {
        try decodeFixedWidthInteger()
    }

    public func decode() throws -> Int64 {
        try decodeFixedWidthInteger()
    }

    public func decode() throws -> UInt64 {
        try decodeFixedWidthInteger()
    }
}
