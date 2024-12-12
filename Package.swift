// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Vinkas",
    platforms: [.iOS(.v13), .macOS(.v11)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(name: "VinkasCore", targets: ["VinkasCore"]),
        .library(name: "VinkasUI", targets: ["VinkasUI"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/firebase/firebase-ios-sdk",
            .upToNextMajor(from: "11.6.0")
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "VinkasCore",
            dependencies: [
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk"),
                .product(name: "FirebaseAnalytics", package: "firebase-ios-sdk"),
                .product(name: "FirebaseAppCheck", package: "firebase-ios-sdk")
            ]
        ),
        .testTarget(
            name: "VinkasCoreTests",
            dependencies: ["VinkasCore"]
        ),

        .target(
            name: "VinkasUI"
        ),
        .testTarget(
            name: "VinkasUITests",
            dependencies: ["VinkasUI"]
        ),
    ]
)
