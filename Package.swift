// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "SwiftANSI",
    products: [
      .library(name: "ANSIStyle", targets: ["ANSIStyle"]),
      .library(name: "ANSICursor", targets: ["ANSICursor"]),
      .library(name: "SwiftANSI", targets: ["ANSIStyle", "ANSICursor"])
    ],
    targets: [
      .target(name: "ANSIStyle", path: "Sources/Style"),
      .target(name: "ANSICursor", path: "Sources/Cursor")
    ]
)
