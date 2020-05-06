/*
 ConsoleLog
 Copyright (C) 2020 Camden Thomson
 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */


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
                print(ANSI.cursorUp(1) + log.description + " (x\(lastLogCount!))")
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
