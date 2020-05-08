public class ANSICursor {
    public enum ErasureRule : Int {
        // erases all content from cursor forwards
        case forward
        // erases all content from cursor backwards
        case backward
        // erases all content regardless of cursor position
        case all

        internal var value : Int {
            self.rawValue
        }
    }

    // moves the cursor up the specified number of lines while maintaining column position
    static public var cursorUp : String {
        cursorEscapeSequence("A", 1)
    }
    
    static public func cursorUp(_ lines:Int) -> String {
        cursorEscapeSequence("A", lines)
    }

    // moves the cursor down the specified number of lines while maintaining column position
    static public var cursorDown : String {
        cursorEscapeSequence("B", 1)
    }

    static public func cursorDown(_ lines:Int) -> String {
        cursorEscapeSequence("B", lines)
    }

    // moves the cursor forward the specified number of columns while maintining line position
    static public var cursorForward : String {
        cursorEscapeSequence("C", 1)
    }

    static public func cursorForward(_ columns:Int) -> String {
        cursorEscapeSequence("C", columns)
    }

    // moves the cursor backwards the specified number of columns while maintaining line position
    static public var cursorBackward : String {
        cursorEscapeSequence("D", 1)
    }

    static public func cursorBackward(_ columns:Int) -> String {
        cursorEscapeSequence("D", columns)
    }

    // moves the cursor up the specified number of lines and to column position 0
    static public var cursorUpLine : String {
        cursorEscapeSequence("E", 1)
    }

    static public func cursorUpLine(_ lines:Int) -> String {
        cursorEscapeSequence("E", lines)
    }

    // moves the cursor down the specified number of lines and to column position 0
    static public var cursorDownLine : String {
        cursorEscapeSequence("F", 1)
    }

    static public func cursorDownLine(_ lines:Int) -> String {
        cursorEscapeSequence("F", lines)
    }

    // moves the cursor to the specified line and column
    public static func setCursorPosition(line:Int, column:Int) -> String {
        cursorEscapeSequence("H", line, column)
    }

    // clears the screen according to the specified erasure rule
    static public var clearScreen : String {
        cursorEscapeSequence("J", ErasureRule.all.value)
    }

    static public func clearScreen(_ rule:ErasureRule) -> String {
        cursorEscapeSequence("J", rule.value)
    }

    // clears the line according to the specified erasure rule
    static public var clearLine : String {
        cursorEscapeSequence("K", ErasureRule.all.value)
    }

    static public func clearLine(_ rule:ErasureRule) -> String {
        cursorEscapeSequence("K", rule.value)
    }

    // scrolls up the specified number of lines; rows are added to the top of the screen and removed from the bottom
    static public var scrollUp : String {
        cursorEscapeSequence("S", 1)
    }

    static public func scrollUp(_ lines:Int) -> String {
        cursorEscapeSequence("S", lines)
    }

    // scrolls down the specified number of lines; rows are added at the bottom of the screen and removed from the top
    static public var scrollDown : String {
        cursorEscapeSequence("T", 1)
    }

    static public func scrollDown(_ lines:Int) -> String {
        cursorEscapeSequence("T", lines)
    }

    // saves the current cursor position
    static public var saveCursorPosition : String {
        cursorEscapeSequence("s")
    }

    // restores the saved cursor position
    static public var restoreCursorPosition : String {
        cursorEscapeSequence("u")
    }

    // builds string for cursor commands with given arguments
    private static func cursorEscapeSequence(_ char:Character, _ arguments:Int...) -> String {
        var sequence = String()
        sequence.append(esc)
        sequence.append("[")
        for (index, argument) in arguments.enumerated() {
            if index != 0 {
                sequence.append(";")
            }
            sequence.append("\(argument)")
        }
        sequence.append(char)
        return sequence
    }
}
