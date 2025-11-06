import SwiftUI
import StepCounterFeature

@main
struct StepCounterFeatureExampleApp: App {
    var body: some Scene {
        WindowGroup {
            DefaultStepCounterFeatureFactory().makeRootView()
        }
    }
}