//
//  StringBinaryEncoderBuffer.swift
//  BinaryCodable
//
//  Created by Vitali Kurlovich on 4/13/20.
//

import Foundation

struct StringBinaryCoder {
    enum StringEncodeView {
        case auto
        case utf8
        case utf16
        case unicode
    }

    enum StringViewType: UInt8 {
        case utf0 = 0
        case utf8 = 8
        case utf16 = 16
        case utf32 = 21
    }

    static func viewType(_ string: String) -> StringViewType {
        if string.isEmpty {
            return .utf0
        }

        guard let max = string.unicodeScalars.max() else {
            return .utf8
        }

        if max.value <= UInt8.max {
            return .utf8
        }

        if max.value <= UInt16.max {
            return .utf16
        }

        return .utf32
    }
}

struct StringBinaryDecoderBuffer {
    let decoderBuffer: BinaryDecoderBuffer

    func decode() throws -> String {
        try decodeAuto()
    }

    func decodeAuto() throws -> String {
        guard let type = StringBinaryCoder.StringViewType(rawValue: try decoderBuffer.decode()) else {
            return ""
        }

        switch type {
        case .utf0:
            return ""
        case .utf8:
            let buffer: [UInt8] = try decoderBuffer.decode()

            let view = buffer.map { (char) -> Unicode.Scalar in
                Unicode.Scalar(char)
            }

            let unicodeScalar = String.UnicodeScalarView(view)

            return String(unicodeScalar)

        case .utf16:
            let buffer: [UInt16] = try decoderBuffer.decode()

            let view = buffer.map { (char) -> Unicode.Scalar in
                Unicode.Scalar(char)!
            }

            let unicodeScalar = String.UnicodeScalarView(view)

            return String(unicodeScalar)

        case .utf32:
            let buffer: [UInt32] = try decoderBuffer.decode()
            let view = buffer.map { (char) -> Unicode.Scalar in
                Unicode.Scalar(char)!
            }

            let unicodeScalar = String.UnicodeScalarView(view)

            return String(unicodeScalar)
        }
    }
}

struct StringBinaryEncoderBuffer {
    let encoderBuffer: BinaryEncoderBuffer

    func encode(_ value: String) {
        encodeAuto(value)
    }

    func encodeAuto(_ value: String) {
        let type = StringBinaryCoder.viewType(value)
        encoderBuffer.encode(type.rawValue)

        switch type {
        case .utf0:
            break
        case .utf8:
            let buffer = value.utf8.map { (unit) -> UInt8 in
                UInt8(unit)
            }
            encoderBuffer.encode(contentsOf: buffer)
        case .utf16:
            let buffer = value.utf16.map { (unit) -> UInt16 in
                UInt16(unit)
            }
            encoderBuffer.encode(contentsOf: buffer)
        case .utf32:
            let buffer = value.unicodeScalars.map { (unit) -> UInt32 in
                unit.value
            }
            encoderBuffer.encode(contentsOf: buffer)
        }
    }
}
