// swift-tools-version:5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

#if os(iOS) || os(macOS) || os(watchOS) || os(tvOS)
let package = Package(
    name: "Keychain",
    platforms: [
        .macOS(.v13),
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Keychain",
            targets: ["Keychain"]),
    ],
    dependencies: [
        .package(url: "https://github.com/OperatorFoundation/KeychainMacOS", from: "1.0.3"),
        .package(url: "https://github.com/OperatorFoundation/KeychainTypes", from: "1.0.2"),
    ],
    targets: [
        .target(
            name: "Keychain",
            dependencies: ["KeychainMacOS", "KeychainTypes"]),
        .testTarget(
            name: "KeychainTests",
            dependencies: ["KeychainMacOS", "KeychainTypes",]),
    ],
    swiftLanguageVersions: [.v5]
)
#else
let package = Package(
    name: "Keychain",
    products: [
        .library(
            name: "Keychain",
            targets: ["Keychain"]),
    ],
    dependencies: [
        .package(url: "https://github.com/OperatorFoundation/KeychainLinux", from: "2.0.4"),
        .package(url: "https://github.com/OperatorFoundation/KeychainTypes", from: "1.0.2"),
    ],
    targets: [
        .target(
            name: "Keychain",
            dependencies: [
                "KeychainLinux",
                "KeychainTypes",
            ]),
        .testTarget(
            name: "KeychainTests",
            dependencies: ["Keychain", "KeychainLinux", "KeychainTypes",]),
    ],
    swiftLanguageVersions: [.v5]
)
#endif
