//
//  Database.swift
//  KituraGymApi
//
//  Created by Wojciech Bilicki on 20/04/2017.
//
//

import Foundation
import SwiftKuery
import SwiftKueryPostgreSQL
import PromiseKit

public class Database {

    let queue = DispatchQueue(label: "qos", attributes: .concurrent)

    static let gymTable = GymTable()
    static let coachTable = CoachTable()
    static let activitiesTable = ActivityTable()


    private func createConnection() -> Connection {
        return PostgreSQLConnection(host: Config.databaseHost, port: Config.databasePort, options: [.userName(Config.userName), .password(Config.password), .databaseName(Config.databaseName)])
    }


    static func allGyms() -> Select {
        return Select(gymTable.id, gymTable.name, gymTable.address, from: gymTable)
    }

    static func gyms(byName name: String) -> Select {
        return Select(from: Database.gymTable).where(Database.gymTable.name == name)
    }

    static func allCoaches() -> Select {
        return Select(coachTable.id, coachTable.name, coachTable.lastName, coachTable.age, coachTable.gymId, from: coachTable)
    }

    static func allActivities() -> Select {
        return Select(activitiesTable.id, activitiesTable.name, activitiesTable.description, activitiesTable.isReservable, activitiesTable.gymId, from: activitiesTable)
    }


    func queryGyms(with selection: Select) -> Promise<[Gym]> {
        let connection = createConnection()

        return firstly {
            connection.connect()
            }
            .then(on: queue) {result -> Promise<QueryResult> in selection.execute(connection)}
            .then(on: queue) { result -> ResultSet in
                guard let resultSet = result.asResultSet else { throw GymApiError.noResult }
                return resultSet
            }.then(on: queue) { resultSet -> [Gym] in
                let fields = resultToRows(resultSet: resultSet)
                return fields.flatMap(Gym.init(fields: ))
            }.always {
                connection.closeConnection()
        }
    }
}
