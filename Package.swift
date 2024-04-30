// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Adyen",
    defaultLocalization: "en-us",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "Adyen",
            targets: ["Adyen"]
        ),
        .library(
            name: "AdyenEncryption",
            targets: ["AdyenEncryption"]
        ),
        .library(
            name: "AdyenSwiftUI",
            targets: ["AdyenSwiftUI"]
        ),
        .library(
            name: "AdyenActions",
            targets: ["AdyenActions"]
        ),
        .library(
            name: "AdyenCard",
            targets: ["AdyenCard"]
        ),
        .library(
            name: "AdyenComponents",
            targets: ["AdyenComponents"]
        ),
        .library(
            name: "AdyenSession",
            targets: ["AdyenSession"]
        ),
        .library(
            name: "AdyenDropIn",
            targets: ["AdyenDropIn"]
        ),
        .library(
            name: "AdyenWeChatPay",
            targets: ["AdyenWeChatPay"]
        ),
        .library(
            name: "AdyenCashAppPay",
            targets: ["AdyenCashAppPay"]
        ),
        .library(
            name: "AdyenTwint",
            targets: ["AdyenTwint"]
        ),
        .library(
            name: "AdyenDelegatedAuthentication",
            targets: ["AdyenDelegatedAuthentication"]
        )
    ],
    dependencies: [
        .package(
            name: "Adyen3DS2",
            url: "https://github.com/Adyen/adyen-3ds2-ios",
            .exact(Version(2, 4, 1))
        ),
        .package(
            name: "AdyenAuthentication",
            url: "https://github.com/Adyen/adyen-authentication-ios",
            .exact(Version(2, 0, 0))
        ),
        .package(
            name: "AdyenNetworking",
            url: "https://github.com/Adyen/adyen-networking-ios",
            .exact(Version(2, 0, 0))
        ),
        .package(
            name: "AdyenWeChatPayInternal",
            url: "https://github.com/Adyen/adyen-wechatpay-ios",
            .exact(Version(2, 1, 0))
        ),
        .package(
            name: "PayKit",
            url: "https://github.com/cashapp/cash-app-pay-ios-sdk",
            .exact(Version(0, 5, 1))
        )
    ],
    targets: [
        .target(
            name: "Adyen",
            dependencies: [
                .product(name: "AdyenNetworking", package: "AdyenNetworking")
            ],
            path: "Adyen",
            exclude: [
                "Info.plist",
                "Utilities/Non SPM Bundle Extension" // This is to exclude `BundleExtension.swift` file, since swift packages has different code to access internal resources.
            ],
            resources: [.process("PrivacyInfo.xcprivacy")]
        ),
        .target(
            name: "AdyenEncryption",
            dependencies: [
                .target(name: "Adyen")
            ],
            path: "AdyenEncryption",
            exclude: [
                "Info.plist"
            ]
        ),
        .target(
            name: "AdyenSwiftUI",
            dependencies: [],
            path: "AdyenSwiftUI",
            exclude: [
                "Info.plist"
            ]
        ),
        .target(
            name: "AdyenActions",
            dependencies: [
                .target(name: "Adyen"),
                .product(name: "Adyen3DS2", package: "Adyen3DS2")
            ],
            path: "AdyenActions",
            exclude: [
                "Info.plist",
                "Utilities/Non SPM Bundle Extension" // This is to exclude `BundleExtension.swift` file, since swift packages has different code to access internal resources.
            ]
        ),
        .target(
            name: "AdyenCard",
            dependencies: [
                .target(name: "Adyen"),
                .target(name: "AdyenEncryption")
            ],
            path: "AdyenCard",
            exclude: [
                "Info.plist",
                "Utilities/Non SPM Bundle Extension" // This is to exclude `BundleExtension.swift` file, since swift packages has different code to access internal resources.
            ]
        ),
        .target(
            name: "AdyenComponents",
            dependencies: [
                .target(name: "Adyen"),
                .target(name: "AdyenEncryption")
            ],
            path: "AdyenComponents",
            exclude: ["Info.plist"]
        ),
        .target(
            name: "AdyenSession",
            dependencies: [
                .target(name: "Adyen"),
                .target(name: "AdyenActions")
            ],
            path: "AdyenSession"
        ),
        .target(
            name: "AdyenDropIn",
            dependencies: [
                .target(name: "AdyenCard"),
                .target(name: "AdyenComponents"),
                .target(name: "AdyenActions")
            ],
            path: "AdyenDropIn",
            exclude: ["Info.plist"]
        ),
        .target(
            name: "AdyenWeChatPay",
            dependencies: [
                .product(name: "AdyenWeChatPayInternal", package: "AdyenWeChatPayInternal"),
                .target(name: "AdyenActions")
            ],
            path: "AdyenWeChatPay/WeChatPayActionComponent"
        ),
        .target(
            name: "AdyenCashAppPay",
            dependencies: [
                .target(name: "Adyen"),
                .product(name: "PayKit", package: "PayKit"),
                .product(name: "PayKitUI", package: "PayKit")
            ],
            path: "AdyenCashAppPay"
        ),
        .target(
            name: "AdyenTwint",
            dependencies: [
                .target(name: "Adyen"),
                .target(name: "AdyenActions"),
                .target(name: "TwintSDK")
            ],
            path: "AdyenTwint"
        ),
        .binaryTarget(
            name: "TwintSDK",
            path: "XCFramework/Dynamic/TwintSDK.xcframework"
        ),
        .target(
            name: "AdyenDelegatedAuthentication",
            dependencies: [
                .product(name: "AdyenAuthentication", package: "AdyenAuthentication")
            ],
            path: "AdyenDelegatedAuthentication"
        )
    ]
)
