/*
 SwiftANSI
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

import ANSICore

/// Handles text style codes.
enum Style: UInt8 {
    /// System default text style.
    case `default` = 0
    case bold      = 1
    case faint     = 2
    case italic    = 3
    case underline = 4
    case blink     = 5
    case inverse   = 7

    /// The ANSI style code.
    var ansiCode: String {
        csi + "\(rawValue)m"
    }
}
