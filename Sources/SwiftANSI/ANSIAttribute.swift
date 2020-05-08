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


public enum ANSIAttribute {
    // handles text forground and background coloring
    // NOTE: bright colors are handled with UInt8 extension
    public enum Color : UInt8 {
        case black     = 0
        case red       = 1
        case green     = 2
        case yellow    = 3
        case blue      = 4
        case magenta   = 5
        case cyan      = 6
        case white     = 7
        case `default` = 9
        
        internal var value : UInt8 {
            rawValue + 30
        }
        
        internal var backgroundValue : UInt8 {
            rawValue + 40
        }
    }

    // handles text styling
    public enum Style : UInt8 {
        case `default` = 0
        case bold      = 1
        case faint     = 2
        case underline = 4
        case blink     = 5
        case inverse   = 7
        
        public var value : UInt8 {
            rawValue
        }
    }
}
