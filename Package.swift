// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ConsoleLog",
    products: [
      .library(name: "ConsoleLog", targets: ["ConsoleLog"])
    ],
    targets: [
      .target(name: "ConsoleLog")
    ]
)
