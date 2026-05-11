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
            url: "https://limelight-sdk.s3.amazonaws.com/iOS/LimelightSDK/1.4.18/LimelightSDK.xcframework.zip",
            checksum: "a78d27a6190bb78b52379f2bf71b348e003d838da4fa48d0c4c6d5a1b9b8a791"
        ),
        .binaryTarget(
            name: "OMSDK_Limelightinc",
            url: "https://limelight-sdk.s3.amazonaws.com/iOS/LimelightSDK/1.4.18/OMSDK_Limelightinc.xcframework.zip",
            checksum: "ff91a149bcb6ef5c77ace58367c9fbceaa782560d936ca5e98b99c4e0fae14ea"
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