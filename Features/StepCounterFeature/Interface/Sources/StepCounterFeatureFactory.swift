import SwiftUI

public protocol StepCounterFeatureFactory {
    func makeRootView() -> AnyView
}