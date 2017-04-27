//
//  FieldMappable.swift
//  KituraGymApi
//
//  Created by Wojciech Bilicki on 22/04/2017.
//
//

import Foundation
import SwiftKuery

public typealias Fields = [String:Any]

public protocol FieldMappable {

    init?( fields: Fields )

}

func resultToRows(resultSet: ResultSet) -> [Fields] {


    let t = resultSet.rows.map { zip(resultSet.titles, $0) }

    let y: [Fields] = t.map {
        var dicts = [String: Any]()

        $0.forEach {
            let (title, value) = $0
            dicts[title] = value
        }

        return dicts
    }

    return y
    
}
