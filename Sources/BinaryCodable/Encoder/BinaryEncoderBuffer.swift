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

    private(set) var data: [UInt8] = []

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

extension BinaryEncoderBuffer {
    func encode(_ value: [UInt8]) {
         data.append(contentsOf: value)
    }
    
    func encode(_ value: Data) {
         data.append(contentsOf: value)
    }
    
    func encode(_ value: Bool) {
        encode(value ? 1 as UInt8 : 0 as UInt8)
    }

    func encode(_ value: Int) {
        appendBytes(of: Int64(value))
    }

    func encode(_ value: UInt) {
        appendBytes(of: UInt64(value))
    }

    func encode(_ value: Int8) {
        appendBytes(of: value)
    }

    func encode(_ value: UInt8) {
        data.append(value)
    }

    func encode(_ value: Int16) {
        appendBytes(of: CFSwapInt16HostToLittle(UInt16(bitPattern: value)))
    }

    func encode(_ value: UInt16) {
        appendBytes(of: CFSwapInt16HostToLittle(value))
    }

    func encode(_ value: Int32) {
        appendBytes(of: CFSwapInt32HostToLittle(UInt32(bitPattern: value)))
    }

    func encode(_ value: UInt32) {
        appendBytes(of: CFSwapInt32HostToLittle(value))
    }

    func encode(_ value: Int64) {
        appendBytes(of: CFSwapInt64HostToLittle(UInt64(bitPattern: value)))
    }

    func encode(_ value: UInt64) {
        appendBytes(of: CFSwapInt64HostToLittle(value))
    }

    func encode(_ value: Float) {
        appendBytes(of: CFConvertFloatHostToSwapped(value))
    }

    func encode(_ value: Double) {
        appendBytes(of: CFConvertDoubleHostToSwapped(value))
    }
    
    func encode<B:BinaryEncoded>(_ value: B) throws {
        let encoder = BinaryEncoder()
       
        let data = try  encoder.encode(value)
        encode(data)
    }

    func encode(_ encodable: Encodable) throws {
        switch encodable {
        case let v as Int:
            encode(v)
        case let v as UInt:
            encode(v)

        case let v as Int64:
            encode(v)

        case let v as UInt64:
            encode(v)

        case let v as Float:
            encode(v)
        case let v as Double:
            encode(v)

        case let v as Bool:
            encode(v)

        case let v as Int8:
            encode(v)

        case let v as UInt8:
            encode(v)

        case let v as Int16:
            encode(v)

        case let v as UInt16:
            encode(v)

        case let v as Int32:
            encode(v)

        case let v as UInt32:
            encode(v)

        case let v as BinaryEncoded:
            try encode(v)
        
        default:
            throw Error.typeNotConformingToBinaryEncodable(type(of: encodable))
        }
    }
}
