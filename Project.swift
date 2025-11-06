import ProjectDescription
import ProjectDescriptionHelpers

let commonFoundationLibrary = FoundationLibrary(name: "CommonFoundation")
let designSystem = FoundationLibrary(name: "DesignSystem")

let project = Project(
    name: "StepMeter",
    targets: [
        .target(
            name: "StepMeter",
            destinations: .iOS,
            product: .app,
            bundleId: "dev.tuist.StepMeter",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            buildableFolders: [
                "App/Sources",
                "App/Resources",
            ],
            dependencies: [
                .target(name: commonFoundationLibrary.name),
                .target(name: designSystem.name),
                .project(target: "StepCounterFeature", path: "Features/StepCounterFeature")
            ]
        ),
        
        .target(
            name: "StepMeterTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "dev.tuist.StepMeterTests",
            infoPlist: .default,
            buildableFolders: [
                "App/Tests"
            ],
            dependencies: [.target(name: "StepMeter")]
        ),
    ]
    + commonFoundationLibrary.targets
    + designSystem.targets
)
