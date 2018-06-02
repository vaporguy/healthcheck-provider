// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HealthcheckProvider",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "HealthcheckProvider",
            targets: ["HealthcheckProvider"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", .upToNextMajor(from: "2.4.4")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "HealthcheckProvider",
            dependencies: ["Vapor"]),
        .testTarget(
            name: "HealthcheckProviderTests",
            dependencies: ["HealthcheckProvider", "Vapor", "Testing"]),
    ]
)
