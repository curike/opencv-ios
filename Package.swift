    // swift-tools-version: 5.8
    // The swift-tools-version declares the minimum version of Swift required to build this package.

    import PackageDescription

    let version = "4.9.0"
    let checksum = "6816f09b459cc07e5f736f87a77e52f72bfef2c4d089aa38256af00a2c7ff047"

    let package = Package(
        name: "OpenCV",
        platforms: [
            .iOS(.v14)
        ],
        products: [
            .library(
                name: "OpenCV",
                targets: ["opencv2", "opencv2-dependencies"]),
        ],
        targets: [
            .binaryTarget(
                name: "opencv2",
                url: "https://github.com/ars-nomura/opencv-ios/releases/download/\(version)/opencv2.xcframework.zip",
                checksum: checksum
            ),
            .target(
                name: "opencv2-dependencies",
                linkerSettings: [
                    .linkedFramework("AVFoundation"),
                    .linkedFramework("CoreImage"),
                    .linkedFramework("CoreMedia"),
                    .linkedFramework("CoreVideo"),
                    .linkedFramework("Accelerate"),
                    .linkedLibrary("c++")
                ]
            ),
        ]
    )
