import SwiftUI
import CommonFoundation
import DesignSystem
import StepCounterFeature

public struct ContentView: View {
    public init() {}

    public var body: some View {
        VStack {
            Text("Hello, \(foo())!")
                .padding()
            
            Text("Design system version: \(DesignSystem.version)")
            
            DefaultStepCounterFeatureFactory().makeRootView()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
