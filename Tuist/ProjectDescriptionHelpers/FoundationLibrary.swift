import ProjectDescription

public struct FoundationLibrary: Sendable {
    public let name: String
    public var bundleIDBase: String = "com.nsscreencast.tuist"
    
    public init(name: String, bundleIDBase: String? = nil) {
        self.name = name
        if let bundleIDBase {
            self.bundleIDBase = bundleIDBase
        }
    }
    
    public var targets: [Target] {
        [
            .target(
                name: name,
                destinations: .iOS,
                product: .framework,
                bundleId: "\(bundleIDBase).\(name.lowercased())",
                buildableFolders: [
                    .folder("Foundation/\(name)/Sources")
                ]
            ),
            .target(
                name: "\(name)Tests",
                destinations: .iOS,
                product: .unitTests,
                bundleId: "\(bundleIDBase).\(name.lowercased()).tests",
                buildableFolders: [
                    .folder("Foundation/\(name)/Tests")
                ],
                dependencies: [
                    .target(name: name)
                ]
            )
        ]
    }
}
