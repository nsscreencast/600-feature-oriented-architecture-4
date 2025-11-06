import ProjectDescription

private let nameAttr = Template.Attribute.required("name")

private let template = Template(
    description: "Creates a new Foundation Library",
    attributes: [
        nameAttr
    ],
    items: [
        .string(
            path: "Foundation/\(nameAttr)/Sources/\(nameAttr).swift",
            contents: """
            public enum \(nameAttr) {
                public static var version = "1.0"
            }
            """
        ),
        
        .string(
            path: "Foundation/\(nameAttr)/Tests/\(nameAttr)Tests.swift",
            contents: """
            import Testing
            @testable import \(nameAttr)
            
            @Test
            func testVersion() {
                #expect(\(nameAttr).version == "1.0")
            }
            """
        )
    ]
)
