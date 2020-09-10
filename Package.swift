// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "SwiftANSI",
    products: [
      .library(name: "ANSIGraphics", targets: ["Graphics"]),
      .library(name: "ANSICursor", targets: ["Cursor"]),
      .library(name: "SwiftANSI", targets: ["Graphics", "Cursor"])
    ],
    targets: [
      .target(name: "Graphics", dependencies: ["ANSICore"]),
      .target(name: "Cursor", dependencies: ["ANSICore"]),
      .target(name: "ANSICore")
    ]
)
