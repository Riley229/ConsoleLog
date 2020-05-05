public enum LogLevel : Int, Comparable {
    // Should only be used when tracing the execution of a program.
    case trace
    // Used for messages which are only of use when debugging a program.
    case debug
    // Appropiate for informational messages.
    case info
    // Appropriate for conditions that are not error conditions, but that may require special handling.
    case notice
    // Appropriate for messages that are not error conditions, but more severe than `.notice`
    case warning
    // Appropriate for error conditions.
    case error
    // Appropriate for critical error conditions that usually require immediate attention.
    case critical

    public static func < (left:LogLevel, right:LogLevel) -> Bool {
        left.rawValue < right.rawValue
    }
}
