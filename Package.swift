// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SPMZip",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SPMZip",
            targets: ["SPMZip"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SPMZip",
            dependencies: ["Minizip"],
            path: "Sources/SPMZip",
            exclude: ["minizip", "zlib"]),
        .target(
            name: "Minizip",
            dependencies: [],
            path: "Sources/SPMZip/minizip",
            exclude: ["module"],
            linkerSettings: [
                .linkedLibrary("z")
            ]),
        .testTarget(
            name: "SPMZipTests",
            dependencies: ["SPMZip"]),
    ]
)
