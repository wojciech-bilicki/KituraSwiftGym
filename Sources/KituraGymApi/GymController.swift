//
//  GymController.swift
//  KituraGymApi
//
//  Created by Wojciech Bilicki on 18/04/2017.
//
//

import Foundation
import Kitura
import PromiseKit
import SwiftKuery
import SwiftyJSON
import HeliumLogger

enum GymSearchQuery {
    case all
    case byName(String)
}

public class GymController {

    let queue = DispatchQueue(label: "gym.controller", attributes: .concurrent)

    let database = Database()
    let router = Router()
    init() {
        HeliumLogger.use()
        router.get(handler: onGetGyms)
    }


    private func onGetGyms(request: RouterRequest, response: RouterResponse, callNext: @escaping () -> Void) {

        firstly {
            return try self.database.queryGyms(with: selectGyms(processQuery(request)))

            }.then(on: self.queue) { gyms -> () in
                response.send(json: JSON(gyms.dictionary))
            }.catch(on: self.queue) {
                error in
                response.status(.badRequest)
                response.send(error.localizedDescription)
            }

    }


    func selectGyms(_ query: GymSearchQuery) -> Select {
        switch query {
        case .all:
            return Database.allGyms()
        case .byName(let name):
            return Database.gyms(byName: name)
        }

    }

    func processQuery(_ request: RouterRequest) throws -> GymSearchQuery {
        if let name = request.queryParameters["name"] {
            return GymSearchQuery.byName(name)
        }

        return GymSearchQuery.all
    }
}
