import Testing
@testable import StepCounterFeatureInterface

@Test
func testVersion() {
    #expect(StepCounterFeature.version == "1.0")
}