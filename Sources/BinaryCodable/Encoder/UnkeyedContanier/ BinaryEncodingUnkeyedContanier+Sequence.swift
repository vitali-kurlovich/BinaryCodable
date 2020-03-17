//
//   BinaryEncodingUnkeyedContanier+Sequence.swift
//  BinaryCodable
//
//  Created by Vitali Kurlovich on 3/17/20.
//

import Foundation

//
extension BinaryEncodingUnkeyedContanier {
    typealias Error = BinaryEncoder.Error

    /// Encodes the elements of the given sequence.
    ///
    /// - parameter sequence: The sequences whose contents to encode.
    /// - throws: An error if any of the contained values throws an error.
    public mutating
    func encode<T>(contentsOf _: T) throws where T: Sequence, T.Element == Bool {
        throw Error.typeNotSupported
    }

    /// Encodes the elements of the given sequence.
    ///
    /// - parameter sequence: The sequences whose contents to encode.
    /// - throws: An error if any of the contained values throws an error.
    public mutating
    func encode<T>(contentsOf _: T) throws where T: Sequence, T.Element == String {
        throw Error.typeNotSupported
    }

    /// Encodes the elements of the given sequence.
    ///
    /// - parameter sequence: The sequences whose contents to encode.
    /// - throws: An error if any of the contained values throws an error.
    public mutating
    func encode<T>(contentsOf _: T) throws where T: Sequence, T.Element == Double {
        throw Error.typeNotSupported
    }

    /// Encodes the elements of the given sequence.
    ///
    /// - parameter sequence: The sequences whose contents to encode.
    /// - throws: An error if any of the contained values throws an error.
    public mutating
    func encode<T>(contentsOf _: T) throws where T: Sequence, T.Element == Float {
        throw Error.typeNotSupported
    }

    /// Encodes the elements of the given sequence.
    ///
    /// - parameter sequence: The sequences whose contents to encode.
    /// - throws: An error if any of the contained values throws an error.
    public mutating
    func encode<T>(contentsOf _: T) throws where T: Sequence, T.Element == Int {
        throw Error.typeNotSupported
    }

    /// Encodes the elements of the given sequence.
    ///
    /// - parameter sequence: The sequences whose contents to encode.
    /// - throws: An error if any of the contained values throws an error.
    public mutating
    func encode<T>(contentsOf _: T) throws where T: Sequence, T.Element == Int8 {
        throw Error.typeNotSupported
    }

    /// Encodes the elements of the given sequence.
    ///
    /// - parameter sequence: The sequences whose contents to encode.
    /// - throws: An error if any of the contained values throws an error.
    public mutating
    func encode<T>(contentsOf _: T) throws where T: Sequence, T.Element == Int16 {
        throw Error.typeNotSupported
    }

    /// Encodes the elements of the given sequence.
    ///
    /// - parameter sequence: The sequences whose contents to encode.
    /// - throws: An error if any of the contained values throws an error.
    public mutating
    func encode<T>(contentsOf _: T) throws where T: Sequence, T.Element == Int32 {
        throw Error.typeNotSupported
    }

    /// Encodes the elements of the given sequence.
    ///
    /// - parameter sequence: The sequences whose contents to encode.
    /// - throws: An error if any of the contained values throws an error.
    public mutating
    func encode<T>(contentsOf _: T) throws where T: Sequence, T.Element == Int64 {
        throw Error.typeNotSupported
    }

    /// Encodes the elements of the given sequence.
    ///
    /// - parameter sequence: The sequences whose contents to encode.
    /// - throws: An error if any of the contained values throws an error.
    public mutating
    func encode<T>(contentsOf _: T) throws where T: Sequence, T.Element == UInt {
        throw Error.typeNotSupported
    }

    /// Encodes the elements of the given sequence.
    ///
    /// - parameter sequence: The sequences whose contents to encode.
    /// - throws: An error if any of the contained values throws an error.
    public mutating
    func encode<T>(contentsOf _: T) throws where T: Sequence, T.Element == UInt8 {
        throw Error.typeNotSupported
    }

    /// Encodes the elements of the given sequence.
    ///
    /// - parameter sequence: The sequences whose contents to encode.
    /// - throws: An error if any of the contained values throws an error.
    public mutating
    func encode<T>(contentsOf _: T) throws where T: Sequence, T.Element == UInt16 {
        throw Error.typeNotSupported
    }

    /// Encodes the elements of the given sequence.
    ///
    /// - parameter sequence: The sequences whose contents to encode.
    /// - throws: An error if any of the contained values throws an error.
    public mutating
    func encode<T>(contentsOf _: T) throws where T: Sequence, T.Element == UInt32 {
        throw Error.typeNotSupported
    }

    /// Encodes the elements of the given sequence.
    ///
    /// - parameter sequence: The sequences whose contents to encode.
    /// - throws: An error if any of the contained values throws an error.
    public mutating
    func encode<T>(contentsOf _: T) throws where T: Sequence, T.Element == UInt64 {
        throw Error.typeNotSupported
    }

    /// Encodes the elements of the given sequence.
    ///
    /// - parameter sequence: The sequences whose contents to encode.
    /// - throws: An error if any of the contained values throws an error.
    public mutating
    func encode<T>(contentsOf _: T) throws where T: Sequence, T.Element: Encodable {
        throw Error.typeNotSupported
    }
}
