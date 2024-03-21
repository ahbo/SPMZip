// swift-tools-version:4.2
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
        .systemLibrary(
            name: "CZlib",
            path: "Sources/SPMZip/zlib",
            pkgConfig: "zlib"),
        .target(
            name: "Minizip",
            dependencies: ["CZlib"],
            path: "Sources/SPMZip/minizip",
            exclude: ["module"]),
        .target(
            name: "SPMZip",
            dependencies: ["Minizip"],
            path: "Sources/SPMZip",
            exclude: ["minizip", "zlib"]),
        .testTarget(
            name: "SPMZipTests",
            dependencies: ["SPMZip"],
            path: "Tests/SPMZipTests"),
    ]
)
