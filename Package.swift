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
            url: "https://limelight-sdk.s3.amazonaws.com/iOS/LimelightSDK/0.1.5/LimelightSDK.xcframework.zip",
            checksum: "3d6276c50c35c678ae01efd5a30a77df8230fc63d52380077a66e476ed1e2f8c"
        ),
        .binaryTarget(
            name: "OMSDK_Limelightinc",
            url: "https://limelight-sdk.s3.amazonaws.com/iOS/LimelightSDK/0.1.5/OMSDK_Limelightinc.xcframework.zip",
            checksum: "635e861b860c71a511684fdead842e0d094e7496c7a57179a7eef4b8c640bf58"
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