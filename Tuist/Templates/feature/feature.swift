import ProjectDescription
import ProjectDescriptionHelpers

private let nameAttr = Template.Attribute.required("name")
private let bundleIDAttr = Template.Attribute.optional("bundle-id-base", default: "com.nsscreencast.tuist")

private let template = Template(
    description: "Creates a new feature with interface, implementation, tests, test support, and an example app.",
    attributes: [
        nameAttr,
        bundleIDAttr
    ],
    items: [
        // MARK: - Interface
        .string(
            path: "Features/\(nameAttr)/Interface/Sources/\(nameAttr).swift",
            contents: """
            public enum \(nameAttr) {
                public static var version = "1.0"
            }
            """
        ),
        
        .string(
            path: "Features/\(nameAttr)/Interface/Sources/\(nameAttr)Factory.swift",
            contents: """
            import SwiftUI
            
            public protocol \(nameAttr)Factory {
                func makeRootView() -> AnyView
            }
            """
        ),

        // MARK: - Implementation
        
        .string(
            path: "Features/\(nameAttr)/Implementation/Sources/Default\(nameAttr)Factory.swift",
            contents: """
            import SwiftUI
            @_exported import \(nameAttr)Interface
            
            public struct Default\(nameAttr)Factory: \(nameAttr)Factory {
                public init() {
                }
            
                public func makeRootView() -> AnyView {
                    AnyView(
                        VStack {
                            Text("\(nameAttr)")
                            Text("Version: \\(\(nameAttr).version)")
                        }
                    )
                }
            }
            """
        ),
        
        .string(
            path: "Features/\(nameAttr)/TestSupport/Sources/\(nameAttr)TestSupport.swift",
            contents: """
            // TODO
            """
        ),
        
        .string(
            path: "Features/\(nameAttr)/ExampleApp/Sources/\(nameAttr)ExampleApp.swift",
            contents: """
            import SwiftUI
            import \(nameAttr)
            
            @main
            struct \(nameAttr)ExampleApp: App {
                var body: some Scene {
                    WindowGroup {
                        Default\(nameAttr)Factory().makeRootView()
                    }
                }
            }
            """
        ),

        .string(
            path: "Features/\(nameAttr)/Tests/Sources/\(nameAttr)Tests.swift",
            contents: """
            import Testing
            @testable import \(nameAttr)Interface
            
            @Test
            func testVersion() {
                #expect(\(nameAttr).version == "1.0")
            }
            """
        ),
        
        // MARK: - Tuist manifest
        
        .file(path: "Features/\(nameAttr)/Project.swift", templatePath: "Project.swift.stencil")
    ]
)
