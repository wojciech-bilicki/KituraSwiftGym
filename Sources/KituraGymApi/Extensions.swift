//
//  Extensions.swift
//  KituraGymApi
//
//  Created by Wojciech Bilicki on 22/04/2017.
//
//

import Foundation
import PromiseKit
import SwiftKuery

public extension Connection {
    func connect() -> Promise<Void> {
        return Promise { fulfill, reject in
            self.connect() { error in
                if let error = error {
                    reject(error)
                } else {
                    fulfill()
                }
            }

        }
    }
}


public extension Query {
    func execute(_ connection: Connection) -> Promise<QueryResult> {
        return Promise { fulfill, reject in
            self.execute(connection, onCompletion: { (result) in
                fulfill(result)
            })
        }
    }

}
