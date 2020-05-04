// swift-tools-version:5.2

import PackageDescription
#if canImport(Darwin)
let package = Package(
  name: "KwiftUI",
  platforms: [
    .macOS(.v10_15),
    .iOS(.v13),
    .tvOS(.v13),
    .watchOS(.v6)
  ],
  products: [
    .library(
      name: "KwiftUI",
      targets: ["KwiftUI"]),
    .library(
      name: "KoreGraphics",
      targets: ["KoreGraphics"]),
  ],
  dependencies: [],
  targets: [
    .target(name: "KoreGraphics"),
    .target(name: "KwiftUI"),
    .testTarget(
      name: "KwiftUITests",
      dependencies: ["KwiftUI", "KoreGraphics"]),
  ]
)
#else
fatalError("KwiftUI only support Darwin platform!")
#endif
