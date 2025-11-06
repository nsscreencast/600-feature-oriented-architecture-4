import SwiftUI
@_exported import StepCounterFeatureInterface

public struct DefaultStepCounterFeatureFactory: StepCounterFeatureFactory {
    public init() {
    }

    public func makeRootView() -> AnyView {
        AnyView(
            VStack {
                Text("StepCounterFeature")
                Text("Version: \(StepCounterFeature.version)")
            }
        )
    }
}