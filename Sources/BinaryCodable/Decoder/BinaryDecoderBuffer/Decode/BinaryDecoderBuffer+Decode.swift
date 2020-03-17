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

    public func decode() throws -> Int {
        let v: Int64 = try decodeFixedWidthInteger()
        return Int(v)
    }

    public func decode() throws -> UInt {
        let v: UInt64 = try decodeFixedWidthInteger()
        return UInt(v)
    }

    public func decode() throws -> Bool {
        let v: UInt8 = try decodeFixedWidthInteger()
        return v != 0
    }

    public func decode() throws -> Float {
        var swapped = CFSwappedFloat32()
        try read(into: &swapped)
        return CFConvertFloatSwappedToHost(swapped)
    }

    public func decode() throws -> Double {
        var swapped = CFSwappedFloat64()
        try read(into: &swapped)
        return CFConvertDoubleSwappedToHost(swapped)
    }
}
