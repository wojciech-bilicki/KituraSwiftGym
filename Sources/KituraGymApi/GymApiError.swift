//
//  GymApiError.swift
//  KituraGymApi
//
//  Created by Wojciech Bilicki on 22/04/2017.
//
//

import Foundation


enum GymApiError: Error {

    case noConnection
    case noResult
    case databaseError(String)
}

extension GymApiError: LocalizedError {

    var errorDescription: String? {

        switch self {
        case .noConnection:
                return "Could not make a connection"
        case .noResult:
                return "Databse returned no result"
        case .databaseError(let message):
            return "Database error: \(message)"
        }
    }
}
