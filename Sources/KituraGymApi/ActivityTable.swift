//
//  ActivityTable.swift
//  KituraGymApi
//
//  Created by Wojciech Bilicki on 18/04/2017.
//
//

import SwiftKuery

final class ActivityTable: Table {

    let tableName = "activities"

    let id = Column("id")
    let name = Column("name")
    let description = Column("description")
    let isReservable = Column("is_reservable")
    let gymId = Column("gym_id")

}
