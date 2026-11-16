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
let releaseTag = "v5.1.1"
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
            checksum: "d980d3349d6a3faacc7a8f5e71246ff77014e5111518d1a49750e67dd4ccbe31"
        ),
        .binaryTarget(
            name: "NRAVPlayerTracker",
            url: "\(releaseBaseURL)/\(releaseTag)/NRAVPlayerTracker.xcframework.zip",
            checksum: "8bfb20ccd6edf80d3fcc86bf82f8f59fbda3831ed547e632a98aa0cfb44acc28"
        ),
        .binaryTarget(
            name: "NRIMATracker",
            url: "\(releaseBaseURL)/\(releaseTag)/NRIMATracker.xcframework.zip",
            checksum: "aeb8a0b793a14f70fa0d417cf110008297644967aa4a8221207e94b3f15dc414"
        ),
        .binaryTarget(
            name: "NRMediaTailorTracker",
            url: "\(releaseBaseURL)/\(releaseTag)/NRMediaTailorTracker.xcframework.zip",
            checksum: "194f02d74fff621e7ba4e44d06b1cc1c4c4309795f1f989da25e60e26ffbacd2"
        ),
        .binaryTarget(
            name: "NRTHEOplayerTracker",
            url: "\(releaseBaseURL)/\(releaseTag)/NRTHEOplayerTracker.xcframework.zip",
            checksum: "fe29361ba0f3b5fe76d5ec2124fd4bc5f34023ab2f1946142b1042bf53806989"
        ),
    ]
)
