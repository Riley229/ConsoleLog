// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "SwiftANSI",
    products: [
      .library(name: "SwiftANSI", targets: ["SwiftANSI"])
    ],
    targets: [
      .target(name: "SwiftANSI")
    ]
)
