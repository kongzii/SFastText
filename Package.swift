// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SFastText",
    products: [
        .library(
            name: "CFastText",
            targets: ["CFastText"]),
        .library(
            name: "SFastText",
            targets: ["SFastText"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "CFastText"),
        .target(
            name: "SFastText",
            dependencies: ["CFastText"]),
    ]
)
