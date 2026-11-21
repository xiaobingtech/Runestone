// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Languages",
    platforms: [.iOS(.v14)],
    products: [
        .library(name: "RunestoneUITestJavaScriptLanguage", targets: ["RunestoneUITestJavaScriptLanguage"])
    ],
    dependencies: [
        .package(name: "Runestone", path: "../..")
    ],
    targets: [
        .target(
            name: "RunestoneUITestJavaScriptLanguage",
            dependencies: ["TreeSitterJavaScript", "Runestone"],
            path: "Sources/RunestoneJavaScriptLanguage",
            resources: [.copy("queries")]
        ),
        .target(name: "TreeSitterJavaScript", cSettings: [.headerSearchPath("src")])
    ]
)
