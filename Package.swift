    // swift-tools-version: 6.0
    // The swift-tools-version declares the minimum version of Swift required to build this package.

    import PackageDescription

    let version = "4.10.0"
    let checksum = "881572149d01c4cac7d3fb1f6ca244af1d25ef70b0e11312cba53ce7fb411145"

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
