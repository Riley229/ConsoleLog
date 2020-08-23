// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "SwiftANSI",
    products: [
      .library(name: "ANSIStyle", targets: ["Style"]),
      .library(name: "ANSICursor", targets: ["Cursor"]),
      .library(name: "SwiftANSI", targets: ["Style", "Cursor"])
    ],
    targets: [
      .target(name: "Style", dependencies: ["ANSICore"]),
      .target(name: "Cursor", dependencies: ["ANSICore"]),
      .target(name: "ANSICore")
    ]
)
