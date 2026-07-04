    // swift-tools-version: 6.0
    // The swift-tools-version declares the minimum version of Swift required to build this package.

    import PackageDescription

    let version = "4.10.2"
    let checksum = "d99f7f3d8cda8d8a4f165d2693f7ea021d36940dc3f3a09357460b2ff15badf5"

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
