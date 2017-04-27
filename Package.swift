// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "KituraGymApi",
    targets: [
        Target(name: "Server", dependencies: [.Target(name: "KituraGymApi")]),
        Target(name: "KituraGymApi")
    ],

    dependencies:[
        .Package(url: "https://github.com/IBM-Swift/Kitura", majorVersion: 1, minor: 7),
        .Package(url: "https://github.com/IBM-Swift/HeliumLogger", majorVersion: 1, minor: 7),
        .Package(url: "https://github.com/davidungar/miniPromiseKit",        majorVersion: 4),
        .Package(url: "https://github.com/IBM-Swift/Swift-Kuery-PostgreSQL", majorVersion: 0, minor: 10),
        ]
)
