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
            url: "https://github.com/dev-shushant/kourier/releases/download/v0.0.4/KourierIos.xcframework.zip",
            checksum: "02bb9d0c48a38727df576e65caf26d3f924c593b4e3146be0db4d934d9e0e5f7"
        )
    ]
)
