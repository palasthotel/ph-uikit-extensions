// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ph-uikit-extensions",
	platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "ph-uikit-extensions",
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
