    // swift-tools-version: 6.0
    // The swift-tools-version declares the minimum version of Swift required to build this package.

    import PackageDescription

    let version = "4.10.1"
    let checksum = "85b6bbde81e20977af30ef545652a7a93d8c8fe47698e2f07ff4407b1989ed24"

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
