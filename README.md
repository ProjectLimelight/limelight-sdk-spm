# Limelight iOS SDK

Limelight iOS SDK for Swift Package Manager.

## Setup instructions

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

To integrate the SDK into your project using Swift Package Manager, [add as a Xcode Package Dependency](https://developer.apple.com/documentation/xcode/adding-package-dependencies-to-your-app#Add-a-package-dependency) or to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/ProjectLimelight/limelight-sdk-spm.git", .upToNextMajor(from: "1.0.0"))
]
```