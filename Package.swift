// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Runestone",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(name: "Runestone", targets: ["Runestone"]),
        .library(name: "TreeSitter", targets: ["TreeSitter"]),
        .library(name: "RunestoneJavaScriptLanguage", targets: ["RunestoneJavaScriptLanguage"]),
        .library(name: "RunestoneOneDarkTheme", targets: ["RunestoneOneDarkTheme"]),
        .library(name: "RunestonePlainTextTheme", targets: ["RunestonePlainTextTheme"]),
        .library(name: "RunestoneTomorrowTheme", targets: ["RunestoneTomorrowTheme"]),
        .library(name: "RunestoneTomorrowNightTheme", targets: ["RunestoneTomorrowNightTheme"]),
        .library(name: "RunestoneThemeCommon", targets: ["RunestoneThemeCommon"])
    ],
    targets: [
        .target(name: "Runestone", dependencies: [
            "TreeSitter",
            "TreeSitterSupport"
        ], resources: [
            .copy("PrivacyInfo.xcprivacy"),
            .process("TextView/Appearance/Theme.xcassets")
        ]),
        .target(
            name: "TreeSitter",
            exclude: ["LICENSE"],
            sources: ["src/lib.c"],
            publicHeadersPath: "include",
            cSettings: [.headerSearchPath("src"), .define("_DARWIN_C_SOURCE")]
        ),
        .target(name: "TreeSitterSupport", dependencies: ["TreeSitter"]),
        .target(
            name: "RunestoneJavaScriptLanguage",
            dependencies: ["Runestone", "RunestoneJavaScriptGrammar", "RunestoneMarkdownGrammar", "RunestoneMarkdownInlineGrammar"],
            resources: [.copy("Queries")]
        ),
        .target(name: "RunestoneJavaScriptGrammar", path: "Sources/RunestoneGrammars/JavaScript", cSettings: [.headerSearchPath("src")]),
        .target(name: "RunestoneMarkdownGrammar", path: "Sources/RunestoneGrammars/Markdown", cSettings: [.headerSearchPath("src")]),
        .target(name: "RunestoneMarkdownInlineGrammar", path: "Sources/RunestoneGrammars/MarkdownInline", cSettings: [.headerSearchPath("src")]),
        .target(
            name: "RunestoneOneDarkTheme",
            dependencies: ["Runestone", "RunestoneThemeCommon"],
            path: "Example/Themes/Sources/RunestoneOneDarkTheme",
            resources: [.process("Colors.xcassets")]
        ),
        .target(
            name: "RunestonePlainTextTheme",
            dependencies: ["Runestone", "RunestoneThemeCommon"],
            path: "Example/Themes/Sources/RunestonePlainTextTheme"
        ),
        .target(
            name: "RunestoneTomorrowTheme",
            dependencies: ["Runestone", "RunestoneThemeCommon"],
            path: "Example/Themes/Sources/RunestoneTomorrowTheme",
            resources: [.process("Colors.xcassets")]
        ),
        .target(
            name: "RunestoneTomorrowNightTheme",
            dependencies: ["Runestone", "RunestoneThemeCommon"],
            path: "Example/Themes/Sources/RunestoneTomorrowNightTheme",
            resources: [.process("Colors.xcassets")]
        ),
        .target(
            name: "RunestoneThemeCommon",
            dependencies: ["Runestone"],
            path: "Example/Themes/Sources/RunestoneThemeCommon"
        ),
        .target(name: "TestTreeSitterLanguages", cSettings: [
            .headerSearchPath("private"),
            .unsafeFlags(["-w"])
        ]),
        .testTarget(name: "RunestoneTests", dependencies: [
            "Runestone",
            "TreeSitterSupport",
            "TestTreeSitterLanguages"
        ])
    ],
    cLanguageStandard: .c11
)
