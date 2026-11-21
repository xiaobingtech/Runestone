![](https://github.com/simonbs/Runestone/raw/main/Sources/Runestone/Documentation.docc/Resources/hero.png)

### 👋 Welcome to Runestone - a performant plain text editor for iOS with code editing features

Runestone uses GitHub's [Tree-sitter](https://tree-sitter.github.io/tree-sitter/) to parse code to a syntax tree which is used for features that require an understanding of the code in the editor, for example syntax highlighting.

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fsimonbs%2FRunestone%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/simonbs/Runestone)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fsimonbs%2FRunestone%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/simonbs/Runestone)
[![Build and Test](https://github.com/simonbs/Runestone/actions/workflows/build_and_test.yml/badge.svg)](https://github.com/simonbs/Runestone/actions/workflows/build_and_test.yml)
[![Build Documentation](https://github.com/simonbs/Runestone/actions/workflows/build_documentation.yml/badge.svg)](https://github.com/simonbs/Runestone/actions/workflows/build_documentation.yml)
[![Build Example Project](https://github.com/simonbs/Runestone/actions/workflows/build_example_project.yml/badge.svg)](https://github.com/simonbs/Runestone/actions/workflows/build_example_project.yml)
[![CodeQL](https://github.com/simonbs/Runestone/actions/workflows/codeql.yml/badge.svg)](https://github.com/simonbs/Runestone/actions/workflows/codeql.yml)
[![SwiftLint](https://github.com/simonbs/Runestone/actions/workflows/swiftlint.yml/badge.svg)](https://github.com/simonbs/Runestone/actions/workflows/swiftlint.yml)
[![Twitter](https://img.shields.io/badge/Twitter-@simonbs-blue.svg?style=flat)](https://twitter.com/simonbs)
[![Mastodon](https://img.shields.io/badge/Mastodon-@simonbs-blue.svg?style=flat)](https://mastodon.social/@simonbs)

## ✨ Features

- Syntax highlighting.
- Line numbers.
- Code folding.
- Spell checking.
- Support for Apple's Writing Tools.
- Highlight the selected line.
- Show invisible characters (tabs, spaces and line breaks).
- Insertion of character pairs, e.g. inserting the trailing quotation mark when inserting the leading.
- Customization of colors and fonts.
- Toggle line wrapping on and off.
- Adjust height of lines.
- Add a page guide.
- Add vertical and horizontal overscroll.
- Highlight ranges in the text view.
- Search the text using regular expressions.
- Automatically detects if a file is using spaces or tabs for indentation.
- Specify line endings (CR, LF, CRLF) to use when inserting a line break.
- Automatically detect line endings in a text.

## 🚀 Getting Started

Please refer to the [Getting Started](https://docs.runestone.app/documentation/runestone/gettingstarted) article in the documentation and the [Meet Runestone](https://docs.runestone.app/tutorials/meet-runestone) series of tutorials.

In your iOS app's Xcode project, choose **File > Add Package Dependencies** and enter `https://github.com/xiaobingtech/Runestone.git`. Select a release tag that includes the products you need, or use the `main` branch until such a tag is available.

| Product | What it provides |
| --- | --- |
| `Runestone` | The editor |
| `RunestoneJavaScriptLanguage` | `.javaScript`, `.jsx`, `.markdown`, and `.markdownInline` on `TreeSitterLanguage` |
| `RunestoneOneDarkTheme` | `OneDarkTheme` |
| `RunestonePlainTextTheme` | `PlainTextTheme` |
| `RunestoneTomorrowTheme` | `TomorrowTheme` |
| `RunestoneTomorrowNightTheme` | `TomorrowNightTheme` |
| `RunestoneThemeCommon` | Shared theme types |

When switching from a local checkout, remove the local Runestone, `Example/Languages`, and `Example/Themes` package references from your app project. Add the products you use from the remote Runestone package and keep the Swift imports for those product names.

For Xcode Cloud, commit the app's Xcode project changes and its shared `Package.resolved`. Xcode Cloud uses that file to check out the recorded package revision. [Apple's Xcode Cloud dependency documentation](https://developer.apple.com/documentation/xcode/making-dependencies-available-to-xcode-cloud)

## 📖 Documentation

The documentation of all public types is available at [docs.runestone.app](https://docs.runestone.app). The documentation is generated from the Swift code using Apple's [DocC documentation compiler](https://developer.apple.com/documentation/docc).

## 📱 Example App

Open `Example/Example.xcodeproj` in Xcode and run the Example scheme to try Runestone. The **Folding Examples** submenu in the ellipsis menu contains JavaScript and Markdown documents with code folding enabled. You can turn folding on or off using the **Code Folding** setting in the same menu.

The example uses the editor, languages, and themes from the root Swift package in the current checkout.

To add folding to your own text view, set `textView.isCodeFoldingEnabled` to `true` and use a language with a folding query. Refer to the [Code Folding](Sources/Runestone/Documentation.docc/CodeFolding.md) article for more information.

<details>
<summary>Try a local document in Simulator</summary>

To inspect a local UTF-8 document without saving it to preferences, install the
Example and copy the file into its Documents directory:

```sh
device='<simulator UDID>'
container=$(xcrun simctl get_app_container "$device" dk.simonbs.Example data)
cp '/path/to/large-file.json' "$container/Documents/large-file.json"
SIMCTL_CHILD_RUNESTONE_DOCUMENT=large-file.json xcrun simctl launch "$device" dk.simonbs.Example
```

When opening a document this way, the example shows **Jump to Top** and **Jump to Bottom** commands and enables line wrapping and line numbers. Set `RUNESTONE_WRAP_LINES=0` to turn off line wrapping. Use a `.md` or `.markdown` extension for Markdown documents.

</details>

## 🏎 Performance

Runestone was built to be fast. Its good performance is by far mostly thanks to Tree-sitter's incremental parsing and [AvalonEdit's approach for managing lines in a document](https://github.com/icsharpcode/AvalonEdit/blob/master/ICSharpCode.AvalonEdit/Document/DocumentLineTree.cs).

When judging the performance of Runestone, it is key to build your app in the release configuration. The optimizations applied by the compiler when using the release configuration becomes very apparent when opening large documents.

## 🖥 Catalyst

The project should mostly work with Catalyst on the Mac, however, it isn't fully tested and the implementation isn't considered done. The focus is currently on the iPhone and iPad.

## 📱 Projects

The Runestone framework is used by an app of the same name. The Runestone app is a plain text editor for iPhone and iPad that uses all the features of this framework.

<a href="https://apps.apple.com/us/app/runestone-editor/id1548193893" target="_blank"><img width="150" alt="Runestone app icon" src="Assets/runestone-editor-app-icon.png"/></a>

<a href="https://apps.apple.com/us/app/runestone-editor/id1548193893" target="_blank"><img width="150" alt="Download on the App Store" src="https://developer.apple.com/assets/elements/badges/download-on-the-app-store.svg"/></a>

## 👨‍💻 Contributing

Pull requests with bugfixes and new features are much appreciated. I'll be happy to review them and merge them once they're ready, as long as they contain change that fit within the vision of Runestone and provide generally useful functionality.

Clone the repository to get started working on the project.

```bash
git clone https://github.com/xiaobingtech/Runestone.git
```

### Tree-sitter runtime

Runestone bundles the Tree-sitter 0.27.1 C runtime from upstream commit `10eb5ac119eec9cb4267a8e035066473983f5f3a`. `Sources/TreeSitter` contains upstream's `lib/include`, `lib/src`, and `LICENSE`. [Tree-sitter v0.27.1](https://github.com/tree-sitter/tree-sitter/tree/v0.27.1)

When updating the runtime, refresh those paths together and verify the Runestone simulator tests. `TreeSitterSupport.c` uses the runtime's private structures, so review its compatibility with the new version. Preserve the upstream and Unicode license notices.

### Bundled grammars

The JavaScript, Markdown, and Markdown-inline grammar sources and editor queries come from TreeSitterLanguages revision `12e38d632d845ba6e94eff02de53418963a98506`. The C parser and scanner symbols use a Runestone prefix so they can coexist with other copies of the grammars. License notices are in `Sources/RunestoneGrammars/Licenses`. [TreeSitterLanguages source provenance](https://github.com/simonbs/TreeSitterLanguages/blob/12e38d632d845ba6e94eff02de53418963a98506/LANGUAGE_SOURCES.md)

## ❤️ Acknowledgments

- [Tree-sitter](https://tree-sitter.github.io/tree-sitter) is used to parse code incrementally.
- Line management is translated to Swift from [AvalonEdit](https://github.com/icsharpcode/AvalonEdit).
- [swift-tree-sitter](https://github.com/viktorstrate/swift-tree-sitter) and [SwiftTreeSitter](https://github.com/ChimeHQ/SwiftTreeSitter) which have served as inspiration for the Tree-sitter bindings.
- Detection of indent strategy inspired by [auto-detect-indentation](https://github.com/jtokoph/auto-detect-indentation).
- And last (but not least!), thanks a ton to [Alexander Blach](https://twitter.com/Lextar) (developer of [Textastic](https://www.textasticapp.com)), [Till Konitzer](https://twitter.com/knutknatter) (developer of [Essayist](https://www.essayist.app)), [Greg Pierce](https://twitter.com/agiletortoise) (developer of [Drafts](https://getdrafts.com)) and [Max Brunsfeld](https://twitter.com/maxbrunsfeld) (developer of [Tree-sitter](https://tree-sitter.github.io/tree-sitter/)) for pointing me in the right direction when I got stuck.
