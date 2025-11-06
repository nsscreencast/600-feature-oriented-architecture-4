import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "StepCounterFeature",
    targets: [
        .target(
            name: "StepCounterFeatureExampleApp",
            destinations: .iOS,
            product: .app,
            bundleId: ".stepcounterfeature.example-app",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            buildableFolders: [
                "ExampleApp/Sources",
                // "ExampleApp/Resources",
            ],
            dependencies: [
                .target(name: "StepCounterFeature"),
                .target(name: "StepCounterFeatureInterface"),
                .target(name: "StepCounterFeatureTestSupport"),
            ]
        ),

        .target(
             name: "StepCounterFeatureInterface",
             destinations: .iOS,
             product: .framework,
             bundleId: "com.nsscreencast.tuist.stepcounterfeature",
             buildableFolders: [
                 "Interface/Sources",
                 // "Interface/Resources",
             ],
             dependencies: []
         ),

         .target(
             name: "StepCounterFeature",
             destinations: .iOS,
             product: .framework,
             bundleId: "com.nsscreencast.tuist.stepcounterfeature.impl",
             buildableFolders: [
                 "Implementation/Sources",
                 // "Implementation/Resources",
             ],
             dependencies: [
                 .target(name: "StepCounterFeatureInterface"),
                 .project(target: "DesignSystem", path: "../../"),
                 .project(target: "CommonFoundation", path: "../../")
             ]
         ),

         .target(
            name: "StepCounterFeatureTestSupport",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.nsscreencast.tuist.stepcounterfeature.test-support",
            buildableFolders: [
                "TestSupport/Sources",
                // "TestSupport/Resources",
            ],
            dependencies: [
                .target(name: "StepCounterFeatureInterface"),
                .target(name: "StepCounterFeature")
            ]
        ),


        .target(
            name: "StepCounterFeatureTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.nsscreencast.tuist.stepcounterfeature.tests",
            infoPlist: .default,
            buildableFolders: [
                "Tests/Sources",
                // "Tests/Resources",
            ],
            dependencies: [
                .target(name: "StepCounterFeatureInterface"),
                .target(name: "StepCounterFeature"),
                .target(name: "StepCounterFeatureTestSupport"),
            ]
        ),
    ]
)
