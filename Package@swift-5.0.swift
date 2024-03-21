// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "SPMZip",
    products: [
        .library(
            name: "SPMZip",
            targets: ["SPMZip"])
    ],
    targets: [
        .target(
            name: "Minizip",
            dependencies: [],
            path: "Sources/SPMZip/minizip",
            exclude: ["module"],
            linkerSettings: [
                .linkedLibrary("z")
            ]),
        .target(
            name: "SPMZip",
            dependencies: ["Minizip"],
            path: "Sources/SPMZip",
            exclude: ["minizip", "zlib"]),
        .testTarget(
            name: "SPMZipTests",
            dependencies: ["Zip"],
            path: "Tests/SPMZipTests"),
    ]
)
