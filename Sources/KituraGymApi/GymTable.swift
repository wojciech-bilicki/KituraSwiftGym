//
//  GymTable.swift
//  KituraGymApi
//
//  Created by Wojciech Bilicki on 20/04/2017.
//
//

import SwiftKuery

final class GymTable: Table {

    let tableName = "gyms"

    let id = Column("id")
    let name = Column("name")
    let address = Column("address")
}   
