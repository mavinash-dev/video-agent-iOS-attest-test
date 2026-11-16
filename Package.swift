// swift-tools-version:5.5
import PackageDescription

// NOTE: url/checksum below are placeholders, not tied to a release yet.
// They are populated automatically by ios-publish.yml as part of the next
// version release - this file does not become resolvable via SPM until then.
//
// NOTE on NRTHEOplayerTracker specifically: this package declares iOS 12/tvOS 12 as its
// overall platform floor, but NRTHEOplayerTracker's real minimum is iOS 15.0 (THEOplayerSDK-core
// 11.x's own requirement - see NRTHEOplayerTracker.podspec). SPM's binaryTarget has no per-product
// platform override the way a podspec does, so this can't be expressed in the manifest itself:
// a consumer building below iOS 15 who imports NRTHEOplayerTracker will hit a real deployment-target
// error from Xcode at link time, not from SPM resolution. Not a bug in this file - same limitation
// CocoaPods callers avoid only because the podspec can declare its own floor.
let releaseTag = "v5.1.0"
let releaseBaseURL = "https://github.com/newrelic/video-agent-iOS/releases/download"

let package = Package(
    name: "video-agent-iOS",
    platforms: [.iOS(.v12), .tvOS(.v12)],
    products: [
        .library(name: "NewRelicVideoCore", targets: ["NewRelicVideoCore"]),
        .library(name: "NRAVPlayerTracker", targets: ["NRAVPlayerTracker"]),
        .library(name: "NRIMATracker", targets: ["NRIMATracker"]),
        .library(name: "NRMediaTailorTracker", targets: ["NRMediaTailorTracker"]),
        .library(name: "NRTHEOplayerTracker", targets: ["NRTHEOplayerTracker"]),
    ],
    targets: [
        .binaryTarget(
            name: "NewRelicVideoCore",
            url: "\(releaseBaseURL)/\(releaseTag)/NewRelicVideoCore.xcframework.zip",
            checksum: "a0b7d2c5334febcaff686f1f6f52063e0157b71ae3cecd335b350c641ce239b9"
        ),
        .binaryTarget(
            name: "NRAVPlayerTracker",
            url: "\(releaseBaseURL)/\(releaseTag)/NRAVPlayerTracker.xcframework.zip",
            checksum: "e39430c65dd63f627a057412541533e9b7dd0f0e3a94d423095cf4fca497d780"
        ),
        .binaryTarget(
            name: "NRIMATracker",
            url: "\(releaseBaseURL)/\(releaseTag)/NRIMATracker.xcframework.zip",
            checksum: "ad0849c745d36098f083881a264780bca8054b5395cddb7fd01806e61c792caf"
        ),
        .binaryTarget(
            name: "NRMediaTailorTracker",
            url: "\(releaseBaseURL)/\(releaseTag)/NRMediaTailorTracker.xcframework.zip",
            checksum: "c9f00b1bdc444fcaa7746f0f631d0c7ee039ef35ed968ebaa56a0a1c6f50e66b"
        ),
        .binaryTarget(
            name: "NRTHEOplayerTracker",
            url: "\(releaseBaseURL)/\(releaseTag)/NRTHEOplayerTracker.xcframework.zip",
            checksum: "3a4d3c38bb1e51eeaa4edd583a490ffb57ed022dd6aeadbd1423300447f3234e"
        ),
    ]
)
