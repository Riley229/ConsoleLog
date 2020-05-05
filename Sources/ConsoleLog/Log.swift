public struct Log : Hashable, Equatable {
    let message : String?
    let level : LogLevel
    let location : Location

    public func printable() -> String {
        let message = self.message ?? ""
        switch level {
        case .trace:
            return location.printable() + "trace: ".forground(.magenta) + message
        case .debug:
            return location.printable() + "debug: ".forground(.brightCyan) + message
        case .info:
            return location.printable() + message
        case .notice:
            return location.printable() + "notice: ".forground(.yellow) + message
        case .warning:
            return location.printable() + "warning: ".forground(.brightYellow) + message
        case .error:
            return location.printable() + "error: ".forground(.brightRed) + message
        case .critical:
            return location.printable() + "critical: ".forground(.brightMagenta) + message
        }
    }

    public func printLog() {
        print(self.printable())
    }

    public func hash(into hasher:inout Hasher) {
        hasher.combine(message)
        hasher.combine(level)
        hasher.combine(location)
    }

    public static func == (left:Log, right:Log) -> Bool {
        left.message == right.message && left.level == right.level && left.location == right.location
    }
}
