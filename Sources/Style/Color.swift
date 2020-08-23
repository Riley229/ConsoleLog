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

/// Handles text coloring.
enum Color: UInt8 {
    case black     = 0
    case red       = 1
    case green     = 2
    case yellow    = 3
    case blue      = 4
    case magenta   = 5
    case cyan      = 6
    case white     = 7
    /// System default color.
    case `default` = 9

    /// Calculates the forground color code.
    var forground: UInt8 {
        rawValue + 30
    }

    /// Calculates the backgorund color code.
    var background: UInt8 {
        rawValue + 40
    }

    /// Calculates the bright forground color code.
    var brightForground: UInt8 {
        rawValue + 90
    }

    /// Calculates the bright background color code.
    var brightBackground: UInt8 {
        rawValue + 100
    }
}
