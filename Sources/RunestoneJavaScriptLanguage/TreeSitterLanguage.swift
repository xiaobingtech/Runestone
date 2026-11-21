import Foundation
import Runestone
import RunestoneJavaScriptGrammar
import RunestoneMarkdownGrammar
import RunestoneMarkdownInlineGrammar

public extension TreeSitterLanguage {
    static var javaScript: TreeSitterLanguage {
        javaScript(highlightsQuery: query("highlights", in: "JavaScript"))
    }

    static var jsx: TreeSitterLanguage {
        let highlights = ["highlights", "highlights-jsx"]
            .compactMap { queryURL($0, in: "JavaScript") }
            .compactMap { try? String(contentsOf: $0) }
            .joined(separator: "\n")
        let highlightsQuery = highlights.isEmpty ? nil : Query(string: highlights)
        return javaScript(highlightsQuery: highlightsQuery)
    }

    static var markdown: TreeSitterLanguage {
        TreeSitterLanguage(
            runestone_tree_sitter_markdown(),
            highlightsQuery: query("highlights", in: "Markdown"),
            injectionsQuery: query("injections", in: "Markdown"),
            foldsQuery: query("folds", in: "Markdown")
        )
    }

    static var markdownInline: TreeSitterLanguage {
        TreeSitterLanguage(
            runestone_tree_sitter_markdown_inline(),
            highlightsQuery: query("highlights", in: "MarkdownInline"),
            injectionsQuery: query("injections", in: "MarkdownInline")
        )
    }
}

private extension TreeSitterLanguage {
    static func javaScript(highlightsQuery: Query?) -> TreeSitterLanguage {
        TreeSitterLanguage(
            runestone_tree_sitter_javascript(),
            highlightsQuery: highlightsQuery,
            injectionsQuery: query("injections", in: "JavaScript"),
            indentationScopes: .javaScript,
            foldsQuery: query("folds", in: "JavaScript")
        )
    }

    static func query(_ name: String, in language: String) -> Query? {
        queryURL(name, in: language).flatMap { Query(contentsOf: $0) }
    }

    static func queryURL(_ name: String, in language: String) -> URL? {
        Bundle.module.url(forResource: name, withExtension: "scm", subdirectory: "Queries/" + language)
    }
}
