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


public struct ANSICode {
    static private var esc : String {
        "\u{001B}"
    }

    static public var saveCursorPosition : String {
        esc + "[s"
    }

    static public var restoreCursorPosition : String {
        esc + "[u"
    }
    
    public enum ClearType : Int {
        case toEnd       = 0
        case toBeginning = 1
        case entire      = 2
    }

    static public func cursorUp(_ lines:UInt) -> String {
        esc + "[\(lines)A"
    }

    static public func cursorDown(_ lines:UInt) -> String {
        esc + "[\(lines)B"
    }

    static public func cursorForward(_ columns:UInt) -> String {
        esc + "[\(columns)C"
    }

    static public func cursorBackward(_ columns:UInt) -> String {
        esc + "[\(columns)D"
    }

    static public func nextLine(_ lines:UInt) -> String {
        esc + "[\(lines)E"
    }

    static public func previousLine(_ lines:UInt) -> String {
        esc + "[\(lines)F"
    }

    static public func cursorColumn(_ column:UInt) -> String {
        esc + "[\(column)G"
    }

    static public func cursorPosition(line:UInt, column:UInt) -> String {
        esc + "[\(line);\(column)H"
    }

    static public func clearScreen(_ type:ClearType) -> String {
        esc + "[\(type.rawValue)J"
    }

    static public func clearLine(_ type:ClearType) -> String {
        esc + "[\(type.rawValue)K"
    }

    // **********************************************************************
    // MARK: Text Appearance modifier methods
    // **********************************************************************

    static public var `default` : String {
        esc + "[0m"
    }

    static public var bold : String {
        esc + "[1m"
    }

    static public var underline : String {
        esc + "[4m"
    }

    static public var reversed : String {
        esc + "[7m"
    }

    public enum Color {
        case black
        case red
        case green
        case yellow
        case blue
        case magenta
        case cyan
        case white
        case brightBlack
        case brightRed
        case brightGreen
        case brightYellow
        case brightBlue
        case brightMagenta
        case brightCyan
        case brightWhite
        case custom(UInt8)
        
        // Mimics enum rawValue so custom() can accept arguments
        private var rawValue : String {
            switch self {
            case .black:             return "0"
            case .red:               return "1"
            case .green:             return "2"
            case .yellow:            return "3"
            case .blue:              return "4"
            case .magenta:           return "5"
            case .cyan:              return "6"
            case .white:             return "7"
            case .brightBlack:       return "0;1"
            case .brightRed:         return "1;1"
            case .brightGreen:       return "2;1"
            case .brightYellow:      return "3;1"
            case .brightBlue:        return "4;1"
            case .brightMagenta:     return "5;1"
            case .brightCyan:        return "6;1"
            case .brightWhite:       return "7;1"
            case .custom(let value): return "8;5;\(value)"
            }
        }
        
        public var forground : String {
            esc + "[3\(self.rawValue)m"
        }
        
        public var background : String {
            esc + "[4\(self.rawValue)m"
        }
    }
}
