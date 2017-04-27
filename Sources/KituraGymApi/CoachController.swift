//
//  CoachController.swift
//  KituraGymApi
//
//  Created by Wojciech Bilicki on 18/04/2017.
//
//

import Foundation
import Kitura

public class CoachController {

    let router = Router()
    init() {
        router.get("/", handler: onGet)
    }


    private func onGet(request: RouterRequest, response: RouterResponse, next: () -> Void) {
        try? response.send("Coach").end()
    }
}
