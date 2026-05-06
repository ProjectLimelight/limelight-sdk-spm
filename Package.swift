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
            url: "https://limelight-sdk.s3.amazonaws.com/iOS/LimelightSDK/1.4.11/LimelightSDK.xcframework.zip",
            checksum: "2d2421366e5c47a0d68dcfbea5f4442e0b3661391b346a64c2062ddd2185fdd2"
        ),
        .binaryTarget(
            name: "OMSDK_Limelightinc",
            url: "https://limelight-sdk.s3.amazonaws.com/iOS/LimelightSDK/1.4.11/OMSDK_Limelightinc.xcframework.zip",
            checksum: "68d55b83b3dda7df8ba823d22d067b1b670ecae55b686a9eb00727bff1a97235"
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
                .unsafeFlags(["-ObjC"]),  // Required for NSClassFromString to find ObjC classes
            ]
        ),
    ]
)