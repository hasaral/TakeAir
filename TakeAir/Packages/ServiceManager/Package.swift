// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private let utilities = "Utilities"
private let commonModel = "CommonModel"

let package = Package(
    name: "ServiceManager",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ServiceManager",
            targets: ["ServiceManager"]),
    ],
    dependencies: [
        .package(name: utilities, path: "../../Utilities/\(utilities)"),
        .package(name: commonModel, path: "../../CommonModel/\(commonModel)"),

    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ServiceManager", dependencies: [.product(name: utilities, package: utilities),.product(name: commonModel, package: commonModel),]),

    ]
)
