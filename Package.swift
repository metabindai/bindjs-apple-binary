// swift-tools-version: 5.11

import PackageDescription

let package = Package(
    name: "BindJS",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
        .visionOS(.v1)
    ],
    products: [
        .library(name: "BindJS", targets: ["BindJS", "BindJSDependencies"]),
    ],
    dependencies: [
        // GLTFKit2 is a binary framework that must be provided separately
        // (SVGViewKit is statically linked into BindJS.framework, so not needed here)
        .package(url: "https://github.com/warrenm/GLTFKit2", exact: "0.5.14")
    ],
    targets: [
        .binaryTarget(
            name: "BindJS",
            url: "https://github.com/metabindai/bindjs-apple-binary/releases/download/1.1.3/BindJS.xcframework.zip",
            checksum: "ed3c2a18ca8ba4a454fda104b079baf6190825773b0f711d83d2903d25f4af72"
        ),
        .target(name: "BindJSDependencies", dependencies: [
            .product(name: "GLTFKit2", package: "GLTFKit2")
        ]),
    ]
)
