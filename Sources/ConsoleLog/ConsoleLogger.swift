public class ConsoleLogger {
    public let label : String
    
    // Any log below `logLevel` will not be stored or printed to the console.
    public var level = LogLevel.trace

    // Set of all Logs
    var logs : Set<Log> = []

    // Stores most recent log for multiplier
    var lastLogCount : Int?
    var lastLog : Log?

    public init(label:String) {
        self.label = label
    }

    private func log(level:LogLevel, message:String?, file:String, function:String, line:UInt) {
        if level >= self.level {
            let location = Location(file:file, function:function, line:line)
            let log = Log(message:message, level:level, location:location)
            if log == lastLog {
                if lastLogCount == nil {
                    lastLogCount = 1
                } else {
                    lastLogCount! += 1
                }
                print(ANSICursor.up(1) + log.printable() + " (x\(lastLogCount!))")
            } else {
                logs.insert(log)
                log.printLog()
                lastLog = log
                if lastLogCount != nil {
                    lastLogCount = nil
                }
            }
        }
    }

    // **************************************************
    // MARK: Public API
    // **************************************************
    
    public func trace(_ message:String? = nil, file:String = #file, function:String = #function, line:UInt = #line) {
        log(level:.trace, message:message, file:file, function:function, line:line)
    }

    public func debug(_ message:String? = nil, file:String = #file, function:String = #function, line:UInt = #line) {
        log(level:.debug, message:message, file:file, function:function, line:line)
    }

    public func info(_ message:String? = nil, file:String = #file, function:String = #function, line:UInt = #line) {
        log(level:.info, message:message, file:file, function:function, line:line)
    }

    public func notice(_ message:String? = nil, file:String = #file, function:String = #function, line:UInt = #line) {
        log(level:.notice, message:message, file:file, function:function, line:line)
    }

    public func warning(_ message:String? = nil, file:String = #file, function:String = #function, line:UInt = #line) {
        log(level:.warning, message:message, file:file, function:function, line:line)
    }

    public func error(_ message:String? = nil, file:String = #file, function:String = #function, line:UInt = #line) {
        log(level:.error, message:message, file:file, function:function, line:line)
    }

    public func critical(_ message:String? = nil, file:String = #file, function:String = #function, line:UInt = #line) {
        log(level:.critical, message:message, file:file, function:function, line:line)
    }
}
