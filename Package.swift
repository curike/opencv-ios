    // swift-tools-version: 5.8
    // The swift-tools-version declares the minimum version of Swift required to build this package.

    import PackageDescription

    let package = Package(
        name: "OpenCV",
        products: [
            // Products define the executables and libraries a package produces, making them visible to other packages.
            .library(
                name: "OpenCV",
                targets: ["opencv2", "opencv2-dependencies"]),
        ],
        targets: [
            // Targets are the basic building blocks of a package, defining a module or a test suite.
            // Targets can depend on other targets in this package and products from dependencies.
            .binaryTarget(
                name: "opencv2",
                url: "https://github.com/ars-nomura/opencv-ios/releases/download/4.8.0/opencv2.xcframework.zip",
                checksum: "b8ca6cbe0212cae760a0cc3f5af81a62368e02899a1624a488383ab6a175cb3b"
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
