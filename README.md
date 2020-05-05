# ConsoleLog

_ConsoleLog_ is a light-weight Swift command line tool which replaces simple print statements with intuitive messages.  It utilizes default ANSI commands to make your output easier to read, adjust, and understand.

## Table of Contents

- [Setup](#setup-as-a-dependency)
- [Documentation](#documentation)
- [Contributing](#contributing)
- [License](#license)

## Setup as a Dependency

To use the _ConsoleLog_ library in a SwiftPM project, add the following line to the dependencies in your `Package.swift` file:

```swift
.package(url: "https://github.com/Riley229/ConsoleLog.git", from: "0.1.1")
```

Then, include _ConsoleLog_ as a dependency for your executable target:

```swift
let package = Package(
    // name, platform, products, etc.
    dependencies: [
        .package(url: "https://github.com/Riley229/ConsoleLog.git", from: "0.1.1")
	// other dependencies
    ],
    targets: [
        .target(
	  name: "<command-line-tool>",
	  dependencies: ["ConsoleLog"]),
	// other targets
    ]
)
```

## Documentation

To use, start by creating a `ConsoleLogger` to send your messages to:

```swift
// The label will have added uses in future versions, for now it just makes the logger easier to identity.
let log = ConsoleLogger(label:"default")
```

Now, all you have to do is log a message:

```swift
log.warning("Hello, world!")
```

which outputs:
![Image of ConsoleLog Warning Example](Images/ConsoleLogWarningExample.png)

### Log levels

The following `LogLevel`s are supported:
- `trace`
- `debug`
- `info`
- `notice`
- `warning`
- `error`
- `critical`

To only make certain log levels print to the console, simply change the level on the `ConsoleLogger`.  Any message below the specified `LogLevel` will not be printed to the console.  For example:

```swift
log.level = .info
```

## Contributing

If you are intrested in contributing, first read our [Code of Conduct](CODE_OF_CONDUCT.md).

### Step 1
Fork this repo

### Step 2
Hack away and don't forget to add yourself to [CONTRIBUTORS.md](CONTRIBUTORS.md].

### Step 3
Create a new pull request.

## License

This project is licensed under GNU General Public License v3.0 -- see the [LICENSE](LICENSE) file for details.