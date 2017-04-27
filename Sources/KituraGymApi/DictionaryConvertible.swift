//
//  DictionaryConvertible.swift
//  KituraGymApi
//
//  Created by Wojciech Bilicki on 22/04/2017.
//
//

import Foundation

public protocol DictionaryConvertible {
    var dictionary: [String: Any] { get }
}

public extension Array where Element: DictionaryConvertible {
    var dictionary: [[String: Any]] {
        return self.map { $0.dictionary }
    }
}
