// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SFastText",
    products: [
        .library(
            name: "SFastText",
            targets: ["SFastText"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "SFastText",
            dependencies: ["CFastText"]),
        .target(
            name: "CFastText"),
    ]
)
