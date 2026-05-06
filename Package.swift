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
            url: "https://limelight-sdk.s3.amazonaws.com/iOS/LimelightSDK/1.4.13/LimelightSDK.xcframework.zip",
            checksum: "5b20b6da68fa5a4c4a3931ef8bb6599893f20a5d4bbc59fc310bd05adbe22c9f"
        ),
        .binaryTarget(
            name: "OMSDK_Limelightinc",
            url: "https://limelight-sdk.s3.amazonaws.com/iOS/LimelightSDK/1.4.13/OMSDK_Limelightinc.xcframework.zip",
            checksum: "5913b0e05cbdbfe3778de9ad6007de1f845300f99ffe271e58ee795041311992"
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