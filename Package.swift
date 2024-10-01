    // swift-tools-version: 5.8
    // The swift-tools-version declares the minimum version of Swift required to build this package.

    import PackageDescription

    let version = "4.10.0"
    let checksum = "a4883e2e51069c9dd5527aa4f520babd37d2fcff447615abe04e1b0f109d2567"

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
                url: "https://github.com/curike/opencv-ios/releases/download/\(version)/opencv2.xcframework.zip",
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
