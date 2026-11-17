// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "Kourier",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "Kourier",
            targets: ["KourierSwift", "KourierIos"]
        ),
        .library(
            name: "KourierIos",
            targets: ["KourierIos"]
        ),
    ],
    targets: [
        .target(
            name: "KourierSwift",
            dependencies: [
                "KourierIos"
            ],
            path: "Sources/KourierSwift",
            linkerSettings: [
                .linkedLibrary("sqlite3"),
                .linkedLibrary("c++")
            ]
        ),
        .binaryTarget(
            name: "KourierIos",
            url: "https://github.com/dev-shushant/kourier/releases/download/v0.0.2/KourierIos.xcframework.zip",
            checksum: "4c6733e29e250b1ed661e7f64a705e08f7e80fa8b94fbbc833872e69dfa4cc7d"
        )
    ]
)
