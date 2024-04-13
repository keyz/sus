// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "sus",
    platforms: [.macOS(.v10_15)],
    dependencies: [
        .package(
            url: "https://github.com/apple/swift-argument-parser",
            from: "1.3.1"
        ),
        .package(
            url: "https://github.com/sindresorhus/KeyboardShortcuts",
            from: "2.0.0"
        ),
    ],
    targets: [
        .executableTarget(
            name: "sus",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "KeyboardShortcuts", package: "KeyboardShortcuts"),
            ]
        ),
    ]
)
