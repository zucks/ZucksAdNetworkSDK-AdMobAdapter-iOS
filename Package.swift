// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "ZucksAdNetworkAdMobAdapter",
    platforms: [
        .iOS("15.0"),
    ],
    products: [
        // 利用側には、依存関係を宣言するラッパーターゲットとバイナリ本体をまとめて1つのライブラリとして提供する
        .library(
            name: "ZucksAdNetworkAdMobAdapter",
            targets: [
                "ZucksAdNetworkAdMobAdapterTarget",
                "ZucksAdNetworkAdMobAdapter",
            ]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/zucks/ZucksAdNetworkSDK-iOS.git",
            from: "7.1.0"
        ),
        // Podspecにおける `Google-Mobile-Ads-SDK` の指定と同じ範囲を維持すること
        .package(
            url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
            "12.0.0"..<"13.0.0"
        ),
    ],
    targets: [
        // binaryTargetは依存関係を持てない為、依存関係の宣言はこのラッパーターゲットが担う
        // あわせて、AdMobが名前で動的にロードするアダプタクラスをこのターゲットから参照し、
        // 利用側が `-ObjC` を指定しなくてもリンク時に除去されないようにしている
        .target(
            name: "ZucksAdNetworkAdMobAdapterTarget",
            dependencies: [
                .target(name: "ZucksAdNetworkAdMobAdapter"),
                .product(name: "ZucksAdNetworkSDK", package: "ZucksAdNetworkSDK-iOS"),
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
            ],
            path: "Sources/ZucksAdNetworkAdMobAdapterTarget"
        ),
        .binaryTarget(
            name: "ZucksAdNetworkAdMobAdapter",
            path: "ZucksAdNetworkAdMobAdapter.xcframework"
        ),
    ]
)
