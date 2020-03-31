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
    func encode<T>(contentsOf sequence: T) throws where T: Sequence, T.Element == Bool {
        for item in sequence {
            try encode(item)
        }
    }

    /// Encodes the elements of the given sequence.
    ///
    /// - parameter sequence: The sequences whose contents to encode.
    /// - throws: An error if any of the contained values throws an error.
    public mutating
    func encode<T>(contentsOf sequence: T) throws where T: Sequence, T.Element == String {
        for item in sequence {
            try encode(item)
        }
    }

    /// Encodes the elements of the given sequence.
    ///
    /// - parameter sequence: The sequences whose contents to encode.
    /// - throws: An error if any of the contained values throws an error.
    public mutating
    func encode<T>(contentsOf sequence: T) throws where T: Sequence, T.Element == Double {
       for item in sequence {
            try encode(item)
        }
    }

    /// Encodes the elements of the given sequence.
    ///
    /// - parameter sequence: The sequences whose contents to encode.
    /// - throws: An error if any of the contained values throws an error.
    public mutating
    func encode<T>(contentsOf sequence: T) throws where T: Sequence, T.Element == Float {
        for item in sequence {
            try encode(item)
        }
    }

    /// Encodes the elements of the given sequence.
    ///
    /// - parameter sequence: The sequences whose contents to encode.
    /// - throws: An error if any of the contained values throws an error.
    public mutating
    func encode<T>(contentsOf sequence: T) throws where T: Sequence, T.Element == Int {
        for item in sequence {
            try encode(item)
        }
    }

    /// Encodes the elements of the given sequence.
    ///
    /// - parameter sequence: The sequences whose contents to encode.
    /// - throws: An error if any of the contained values throws an error.
    public mutating
    func encode<T>(contentsOf sequence: T) throws where T: Sequence, T.Element == Int8 {
        for item in sequence {
            try encode(item)
        }
    }

    /// Encodes the elements of the given sequence.
    ///
    /// - parameter sequence: The sequences whose contents to encode.
    /// - throws: An error if any of the contained values throws an error.
    public mutating
    func encode<T>(contentsOf sequence: T) throws where T: Sequence, T.Element == Int16 {
        for item in sequence {
            try encode(item)
        }
    }

    /// Encodes the elements of the given sequence.
    ///
    /// - parameter sequence: The sequences whose contents to encode.
    /// - throws: An error if any of the contained values throws an error.
    public mutating
    func encode<T>(contentsOf sequence: T) throws where T: Sequence, T.Element == Int32 {
        for item in sequence {
            try encode(item)
        }
    }

    /// Encodes the elements of the given sequence.
    ///
    /// - parameter sequence: The sequences whose contents to encode.
    /// - throws: An error if any of the contained values throws an error.
    public mutating
    func encode<T>(contentsOf sequence: T) throws where T: Sequence, T.Element == Int64 {
        for item in sequence {
            try encode(item)
        }
    }

    /// Encodes the elements of the given sequence.
    ///
    /// - parameter sequence: The sequences whose contents to encode.
    /// - throws: An error if any of the contained values throws an error.
    public mutating
    func encode<T>(contentsOf sequence: T) throws where T: Sequence, T.Element == UInt {
        for item in sequence {
            try encode(item)
        }
    }

    /// Encodes the elements of the given sequence.
    ///
    /// - parameter sequence: The sequences whose contents to encode.
    /// - throws: An error if any of the contained values throws an error.
    public mutating
    func encode<T>(contentsOf sequence: T) throws where T: Sequence, T.Element == UInt8 {
        for item in sequence {
            try encode(item)
        }
    }

    /// Encodes the elements of the given sequence.
    ///
    /// - parameter sequence: The sequences whose contents to encode.
    /// - throws: An error if any of the contained values throws an error.
    public mutating
    func encode<T>(contentsOf sequence: T) throws where T: Sequence, T.Element == UInt16 {
        for item in sequence {
            try encode(item)
        }
    }

    /// Encodes the elements of the given sequence.
    ///
    /// - parameter sequence: The sequences whose contents to encode.
    /// - throws: An error if any of the contained values throws an error.
    public mutating
    func encode<T>(contentsOf sequence: T) throws where T: Sequence, T.Element == UInt32 {
        for item in sequence {
            try encode(item)
        }
    }

    /// Encodes the elements of the given sequence.
    ///
    /// - parameter sequence: The sequences whose contents to encode.
    /// - throws: An error if any of the contained values throws an error.
    public mutating
    func encode<T>(contentsOf sequence: T) throws where T: Sequence, T.Element == UInt64 {
        for item in sequence {
            try encode(item)
        }
    }

    /// Encodes the elements of the given sequence.
    ///
    /// - parameter sequence: The sequences whose contents to encode.
    /// - throws: An error if any of the contained values throws an error.
    public mutating
    func encode<T>(contentsOf sequence: T) throws where T: Sequence, T.Element: Encodable {
        for item in sequence {
            try encode(item)
        }
    }
}
