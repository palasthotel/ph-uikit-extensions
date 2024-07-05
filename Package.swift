// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ph-uikit-extensions",
	platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "PHUIKitExtensions",
            targets: ["PHUIKitExtensions"]
		),
    ],
    targets: [
        .target(name: "PHUIKitExtensions"),
        .testTarget(
            name: "PHUIKitExtensionsTests",
            dependencies: ["PHUIKitExtensions"]
		),
    ]
)
