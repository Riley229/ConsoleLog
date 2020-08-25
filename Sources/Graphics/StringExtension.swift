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

public extension String {    
    // Styles
    var bold      : String { apply(Style.bold.ansiCode) }
    var faint     : String { apply(Style.faint.ansiCode) }
    var italic    : String { apply(Style.italic.ansiCode) }
    var underline : String { apply(Style.underline.ansiCode) }
    var blink     : String { apply(Style.blink.ansiCode) }
    var inverse   : String { apply(Style.inverse.ansiCode) }
    
    // Forground colors
    var black         : String { apply(Color.black.forground) }
    var red           : String { apply(Color.red.forground) }
    var green         : String { apply(Color.green.forground) }
    var yellow        : String { apply(Color.yellow.forground) }
    var blue          : String { apply(Color.blue.forground) }
    var magenta       : String { apply(Color.magenta.forground) }
    var cyan          : String { apply(Color.cyan.forground) }
    var white         : String { apply(Color.white.forground) }
    var brightBlack   : String { apply(Color.black.brightForground) }
    var brightRed     : String { apply(Color.red.brightForground) }
    var brightGreen   : String { apply(Color.green.brightForground) }
    var brightYellow  : String { apply(Color.yellow.brightForground) }
    var brightBlue    : String { apply(Color.blue.brightForground) }
    var brightMagenta : String { apply(Color.magenta.brightForground) }
    var brightCyan    : String { apply(Color.cyan.brightForground) }
    var brightWhite   : String { apply(Color.white.brightForground) }

    /**
     Applies a custom color to the string.
     - Parameter value: The value representing a 8-bit color to apply.
     - Returns: The string with forground color applied.
     */
    func color(_ value: UInt8) -> String {
        apply(csi + "38;5;\(value)m")
    }

    // Background colors
    var onBlack         : String { apply(Color.black.background) }
    var onRed           : String { apply(Color.red.background) }
    var onGreen         : String { apply(Color.green.background) }
    var onYellow        : String { apply(Color.yellow.background) }
    var onBlue          : String { apply(Color.blue.background) }
    var onMagenta       : String { apply(Color.magenta.background) }
    var onCyan          : String { apply(Color.cyan.background) }
    var onWhite         : String { apply(Color.white.background) }
    var onBrightBlack   : String { apply(Color.black.brightBackground) }
    var onBrightRed     : String { apply(Color.red.brightBackground) }
    var onBrightGreen   : String { apply(Color.green.brightBackground) }
    var onBrightYellow  : String { apply(Color.yellow.brightBackground) }
    var onBrightBlue    : String { apply(Color.blue.brightBackground) }
    var onBrightMagenta : String { apply(Color.magenta.brightBackground) }
    var onBrightCyan    : String { apply(Color.cyan.brightBackground) }
    var onBrightWhite   : String { apply(Color.white.brightBackground) }

    /**
     Applies a custom color to the background of the string.
     - Parameter value: The value representing a 8-bit color to apply.
     - Returns: The string with background color applied.
     */
    func onColor(_ value: UInt8) -> String {
        apply(csi + "48;5;\(value)m")
    }

    /// Removes all ANSI Attributes from the String.
    /// - Returns: The stripped-down string.
    func stripAttributes() -> String {
        guard !isEmpty else {
            return self
        }
        
        var output = split(separator: esc)
        for (index, string) in output.enumerated() {
            if let end = string.firstIndex(of: "m") {
                output[index] = string[string.index(after: end)...]
            }
        }
        return output.joined()
    }

    /**
     Applies the specified ANSICode to a String.
     - Parameter ansiCode: The ANSICode to apply.
     - Returns: A string with the applied ANSICode.
     */
    func apply(_ ansiCode: String) -> String {
        guard !isEmpty else {
            return self
        }

        var output = ansiCode + self
        if !hasSuffix(Style.default.ansiCode) {
            output.append(Style.default.ansiCode)
        }
        return output
    }
 }
