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


public struct ANSI {
    private static let esc : Character = "\u{001B}"

    // ************************************************************
    // MARK: Format Commands
    // ************************************************************

    public enum Color {
        case black
        case red
        case green
        case yellow
        case blue
        case magenta
        case cyan
        case white
        case `default`
        case brightBlack
        case brightRed
        case brightGreen
        case brightYellow
        case brightBlue
        case brightMagenta
        case brightCyan
        case brightWhite
        case custom(UInt8)
        case rgb(UInt8, UInt8, UInt8)

        internal var value : String {
            switch self {
            case .black:                             return "0"
            case .red:                               return "1"
            case .green:                             return "2"
            case .yellow:                            return "3"
            case .blue:                              return "4"
            case .magenta:                           return "5"
            case .cyan:                              return "6"
            case .white:                             return "7"
            case .default:                           return "9"
            case .brightBlack:                       return "0;1"
            case .brightRed:                         return "1;1"
            case .brightGreen:                       return "2;1"
            case .brightYellow:                      return "3;1"
            case .brightBlue:                        return "4;1"
            case .brightMagenta:                     return "5;1"
            case .brightCyan:                        return "6;1"
            case .brightWhite:                       return "7;1"
            case .custom(let value):                 return "8;5;\(value)"
            case .rgb(let red, let green, let blue): return "8;2;\(red);\(green);\(blue)"
            }
        }
        
        internal var forgroundValue : String {
            "3\(value)"
        }

        internal var backgroundValue : String {
            "4\(value)"
        }
    }

    public enum Attribute : Int {
        case reset
        case bold
        case faint
        case italic
        case underline
        case blinkSlow
        case blinkFast
        case reversed
        case conceal
        case strikethrough
        case underlineDouble  = 21
        case boldOff          = 22
        case italicOff        = 23
        case underlineOff     = 24
        case blinkOff         = 25
        case reversedOff      = 27
        case concealOff       = 28
        case strikethroughOff = 29
        
        public var value : Int {
            self.rawValue
        }
    }

    // applies the specified color as the forground color
    public static func forgroundColor(_ color:Color) -> String {
        formatEscapeSequence(color.forgroundValue)
    }

    // applies the specified color as the baclground color
    public static func backgroundColor(_ color:Color) -> String {
        formatEscapeSequence(color.backgroundValue)
    }

    // applies the specified attribute to the text
    public static func formatText(_ attribute:Attribute) -> String {
        formatEscapeSequence("\(attribute.value)")
    }

    // builds string for format commands with given value
    private static func formatEscapeSequence(_ value:String) -> String {
        var sequence = String()
        sequence.append(esc)
        sequence.append("[")
        sequence.append(value)
        sequence.append("m")
        return sequence
    }

    // ************************************************************
    // MARK: Cursor Commands
    // ************************************************************

    public enum ErasureRule : Int {
        case forward
        case backward
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
