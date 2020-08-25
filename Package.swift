// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "SwiftANSI",
    products: [
      .library(name: "ANSIGraphics", targets: ["Graphics"]),
      .library(name: "ANSICursor", targets: ["Cursor"]),
      .library(name: "SwiftANSI", targets: ["Graphics", "Cursor"])
    ],
    targets: [
      .target(name: "Graphics", dependencies: ["Core"]),
      .target(name: "Cursor", dependencies: ["Core"]),
      .target(name: "Core")
    ]
)
