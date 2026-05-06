// swift-tools-version:5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LimelightSDK",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(
            name: "LimelightSDK",
            targets: ["LimelightSDKResources"]
        ),
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "LimelightSDK",
            url: "https://limelight-sdk.s3.amazonaws.com/iOS/LimelightSDK/1.4.10/LimelightSDK.xcframework.zip",
            checksum: "a08fa13d621ce28775370cfdb8c992894f9001513dbcee9df4083c5eb7733c23"
        ),
        .binaryTarget(
            name: "OMSDK_Limelightinc",
            url: "https://limelight-sdk.s3.amazonaws.com/iOS/LimelightSDK/1.4.10/OMSDK_Limelightinc.xcframework.zip",
            checksum: "44f247133ed2a35613d167b7770d6cbfc839878b73c44676646d0dff04ac2cb7"
        ),
         // This is a wrapper target to configure various settings required by main binary target.
        .target(
            name: "LimelightSDKResources",
            dependencies: [
                .target(name: "LimelightSDK"),
                .target(name: "OMSDK_Limelightinc")
            ],
            linkerSettings: [
                .linkedFramework("AdSupport"),
                .linkedFramework("AppTrackingTransparency"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("CoreLocation"),
                .linkedFramework("Foundation"),
                .linkedFramework("StoreKit"),
                .linkedFramework("UIKit"),
                .linkedFramework("WebKit"),
            ]
        ),
    ]
)