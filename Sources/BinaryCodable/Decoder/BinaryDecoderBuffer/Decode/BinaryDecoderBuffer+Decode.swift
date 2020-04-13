//
//  BinaryDecoderBuffer+Decode.swift
//  BinaryCodable
//
//  Created by Vitali Kurlovich on 3/17/20.
//

import CoreFoundation
import Foundation

extension BinaryDecoderBuffer {
    func decode() throws -> String {
        // try decodeFixedWidthInteger()

        let stringBinaryDecoder = StringBinaryDecoderBuffer(decoderBuffer: self)

        return try stringBinaryDecoder.decode()
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

    public func decode<T: Decodable>() throws -> T {
        let type = T.self

        switch type {
        case is Int.Type:
            let v: Int = try decode()
            return v as! T

        case is UInt.Type:
            let v: UInt = try decode()
            return v as! T

        case is Float.Type:
            let v: Float = try decode()
            return v as! T

        case is Double.Type:
            let v: Double = try decode()
            return v as! T

        case is Bool.Type:
            let v: Bool = try decode()
            return v as! T

        case is Int8.Type:
            let v: Int8 = try decode()
            return v as! T

        case is UInt8.Type:
            let v: UInt8 = try decode()
            return v as! T

        case is Int16.Type:
            let v: Int16 = try decode()
            return v as! T

        case is UInt16.Type:
            let v: UInt16 = try decode()
            return v as! T

        case is Int32.Type:
            let v: Int32 = try decode()
            return v as! T

        case is UInt32.Type:
            let v: UInt32 = try decode()
            return v as! T

        case is Int64.Type:
            let v: Int64 = try decode()
            return v as! T

        case is UInt64.Type:
            let v: UInt64 = try decode()
            return v as! T

        case is String.Type:
            let v: String = try decode()
            return v as! T

        case is [Int].Type:
            let v: [Int] = try decodeArray()
            return v as! T

        case is [UInt].Type:
            let v: [UInt] = try decodeArray()
            return v as! T

        case is [Int8].Type:
            let v: [Int8] = try decodeArray()
            return v as! T

        case is [UInt8].Type:
            let v: [UInt8] = try decodeArray()
            return v as! T

        case is [Int16].Type:
            let v: [Int16] = try decodeArray()
            return v as! T

        case is [UInt16].Type:
            let v: [UInt16] = try decodeArray()
            return v as! T

        case is [Int32].Type:
            let v: [Int32] = try decodeArray()
            return v as! T

        case is [UInt32].Type:
            let v: [UInt32] = try decodeArray()
            return v as! T

        case is [Int64].Type:
            let v: [Int64] = try decodeArray()
            return v as! T

        case is [UInt64].Type:
            let v: [UInt64] = try decodeArray()
            return v as! T

        case is [Bool].Type:
            let v: [Bool] = try decodeArray()
            return v as! T

        case is [Float].Type:
            let v: [Float] = try decodeArray()
            return v as! T

        case is [Double].Type:
            let v: [Double] = try decodeArray()
            return v as! T

        default:
            let decoder = BinaryDecoder()
            decoder.decoderBuffer = self
            return try T(from: decoder)
        }
    }
}

private
extension BinaryDecoderBuffer {
    func decodeFixedWidthInteger<T: FixedWidthInteger>() throws -> T {
        var v = T()
        try read(into: &v)
        return T(littleEndian: v)
    }
}

private
extension BinaryDecoderBuffer {
    func decodeArray<T: Decodable>() throws -> [T] {
        let count: UInt32 = try decode()

        var array = [T]()
        array.reserveCapacity(Int(count))

        for _ in 0 ..< count {
            let item: T = try decode()
            array.append(item)
        }

        return array
    }
}

extension BinaryDecoderBuffer {
    func decode<S: Sequence, T: Decodable>(_: S.Type) throws -> [T] where S.Element == T {
        try decodeArray()
    }
}
