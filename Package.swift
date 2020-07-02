// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "WebSocketProtocol",
    platforms: [
        .macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v5),
    ],
    products: [
        .library(
            name: "WebSocketProtocol",
            targets: ["WebSocketProtocol"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "WebSocketProtocol",
            dependencies: []),
        .testTarget(
            name: "WebSocketProtocolTests",
            dependencies: ["WebSocketProtocol"]),
    ]
)
