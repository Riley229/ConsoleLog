import Foundation

public struct Log : Hashable, Equatable {
    public enum Category : Int, Comparable {
        // used when tracing the execution of a program
        case trace
        // used when debugging a program
        case debug
        // used for informational messages
        case info
        // used for conditions that are not error conditions, but that may require special handling
        case notice
        // used for messages that are not error conditions, but more severe than `.notice`
        case warning
        // used for error conditions
        case error
        // used for critical error conditions that require immediate attention.
        case critical
        
        public static func < (left:Category, right:Category) -> Bool {
            left.rawValue < right.rawValue
        }
    }
    
    // stores the location where the log was reported, is displayed for `.critical`, `.error`, and `.warning` messages
    public struct Location : Hashable, Equatable {
        let file : String
        let function : String
        let line : UInt

        public var description : String {
            // removes `/home/<user-name>/` from beginning of file path and replaces with `~/`
            let homeDirectory = FileManager.default.homeDirectoryForCurrentUser.absoluteString.dropFirst(7)
            var file = self.file
            if file.hasPrefix(homeDirectory) {
            file = "~/" + String(file.dropFirst(homeDirectory.count))
            }
            return "\(file):\(line): ".bold()
        }
    }
    
    let message : String?
    let level : Category
    let location : Location

    public var description : String {
        let message = self.message ?? ""
        switch level {
        case .trace:
            return location.description + "trace: ".forground(.magenta) + message
        case .debug:
            return location.description + "debug: ".forground(.brightCyan) + message
        case .info:
            return location.description + message
        case .notice:
            return location.description + "notice: ".forground(.yellow) + message
        case .warning:
            return location.description + "warning: ".forground(.brightYellow) + message
        case .error:
            return location.description + "error: ".forground(.brightRed) + message
        case .critical:
            return location.description + "critical: ".forground(.brightMagenta) + message
        }
    }

    public func printLog() {
        print(self.description)
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
