// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Vinkas",
    platforms: [.iOS(.v14), .macOS(.v11)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(name: "VinkasCore", targets: ["VinkasCore"]),
        .library(name: "VinkasFirebase", targets: ["VinkasFirebase"]),
        .library(name: "VinkasUI", targets: ["VinkasUI"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/firebase/firebase-ios-sdk",
            .upToNextMajor(from: "11.6.0")
        ),
        .package(url: "https://github.com/getsentry/sentry-cocoa", from: "8.42.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "VinkasCore",
            dependencies: [
                "VinkasFirebase",
                .product(name: "SentrySwiftUI", package: "sentry-cocoa"),
            ]
        ),
        .testTarget(
            name: "VinkasCoreTests",
            dependencies: ["VinkasCore"]
        ),
        
        .target(
            name: "VinkasFirebase",
            dependencies: [
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk"),
                .product(name: "FirebaseAnalytics", package: "firebase-ios-sdk"),
                .product(name: "FirebaseAppCheck", package: "firebase-ios-sdk")
            ]
        ),
        .testTarget(
            name: "VinkasFirebaseTests",
            dependencies: ["VinkasFirebase"]
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
