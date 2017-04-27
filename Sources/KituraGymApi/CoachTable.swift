//
//  CoachTable.swift
//  KituraGymApi
//
//  Created by Wojciech Bilicki on 18/04/2017.
//
//

import SwiftKuery

final class CoachTable: Table {
    let tableName = "coaches"

    let id = Column("id")
    let name = Column("name")
    let lastName = Column("last_name")
    let age = Column("age")
    let gymId = Column("gym_id")
}
