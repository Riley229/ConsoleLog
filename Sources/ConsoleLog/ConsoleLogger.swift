public class ConsoleLogger {
    public let name : String
    
    // Any log below `category` will not be stored or printed to the console.
    public var level = Log.Category.trace

    // tracks all Logs sent to `ConsoleLogger`
    var logs : Set<Log> = []

    // Stores most recent log and log multiplier
    var lastLogCount : Int?
    var lastLog : Log?

    public init(name:String) {
        self.name = name
    }

    private func log(category:Log.Category, message:String?, file:String, function:String, line:UInt) {
        if level >= self.level {
            let location = Log.Location(file:file, function:function, line:line)
            let log = Log(message:message, level:level, location:location)
            if log == lastLog {
                if lastLogCount == nil {
                    lastLogCount = 1
                } else {
                    lastLogCount! += 1
                }
                print(ANSICode.cursorUp(1) + log.description + " (x\(lastLogCount!))")
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
        log(category:.trace, message:message, file:file, function:function, line:line)
    }

    public func debug(_ message:String? = nil, file:String = #file, function:String = #function, line:UInt = #line) {
        log(category:.debug, message:message, file:file, function:function, line:line)
    }

    public func info(_ message:String? = nil, file:String = #file, function:String = #function, line:UInt = #line) {
        log(category:.info, message:message, file:file, function:function, line:line)
    }

    public func notice(_ message:String? = nil, file:String = #file, function:String = #function, line:UInt = #line) {
        log(category:.notice, message:message, file:file, function:function, line:line)
    }

    public func warning(_ message:String? = nil, file:String = #file, function:String = #function, line:UInt = #line) {
        log(category:.warning, message:message, file:file, function:function, line:line)
    }

    public func error(_ message:String? = nil, file:String = #file, function:String = #function, line:UInt = #line) {
        log(category:.error, message:message, file:file, function:function, line:line)
    }

    public func critical(_ message:String? = nil, file:String = #file, function:String = #function, line:UInt = #line) {
        log(category:.critical, message:message, file:file, function:function, line:line)
    }
}
