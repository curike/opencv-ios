    // swift-tools-version: 5.8
    // The swift-tools-version declares the minimum version of Swift required to build this package.

    import PackageDescription

    let package = Package(
        name: "OpenCV",
        products: [
            // Products define the executables and libraries a package produces, making them visible to other packages.
            .library(
                name: "OpenCV",
                targets: ["OpenCV"]),
        ],
        targets: [
            // Targets are the basic building blocks of a package, defining a module or a test suite.
            // Targets can depend on other targets in this package and products from dependencies.
            .binaryTarget(
                name: "opencv2",
                url: "https://github.com/ars-nomura/opencv-ios/releases/download/4.8.0/opencv-4.8.0-ios-framework.zip",
                checksum: "89c33d2b0a66b287ffc7a7643bfed4ae4a0728a76a5c4c852854efdb300693b3"
            ),
            .target(
                name: "OpenCV",
                dependencies: [
                    "opencv2"
                ]
            ),
        ]
    )
