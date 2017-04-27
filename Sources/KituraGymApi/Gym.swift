//
//  Gym.swift
//  KituraGymApi
//
//  Created by Wojciech Bilicki on 22/04/2017.
//
//

import Foundation

struct Gym {

    let id: Int
    let name: String
    let address: String
}


extension Gym: FieldMappable {

    init?(fields: [String: Any]) {
        if let id = fields["id"] as? Int32 {
            self.id = Int(id)
        } else {
            return nil
        }

        guard let name = fields["name"] as? String else  {
            return nil
        }

        self.name = name

        self.address = fields["address"] as? String ?? ""

    }
}

extension Gym: DictionaryConvertible {
    var dictionary: [String: Any] {

        var basicItems = [String:Any]()
        basicItems["id"] = id
        basicItems["name"] = name
        basicItems["address"] = address
        return basicItems
    }
}
