// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "sus",
    dependencies: [
        .package(
            url: "https://github.com/apple/swift-argument-parser",
            from: "1.3.1"
        ),
    ],
    targets: [
        .executableTarget(
            name: "sus",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]
        ),
    ]
)
