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


public extension String {
    // text styling
    var bold : String { style(.bold) }
    var faint : String { style(.faint) }
    var underline : String { style(.underline) }
    var blink : String { style(.blink) }
    var inverse : String { style(.inverse) }
    
    // applies specified style to String
    private func style(_ style:ANSIAttribute.Style) -> String {
        guard !isEmpty else { return self }
        var output = csi + "\(style.value)m" + self
        if !hasSuffix(csi + "\(ANSIAttribute.Style.default.value)m") {
            output.append(csi + "\(ANSIAttribute.Style.default.value)m")
        }
        return output
    }

    // text forground coloring
    var black : String { forgroundColor(.black) }
    var red : String { forgroundColor(.red) }
    var green : String { forgroundColor(.green) }
    var yellow : String { forgroundColor(.yellow) }
    var blue : String { forgroundColor(.blue) }
    var magenta : String { forgroundColor(.magenta) }
    var cyan : String { forgroundColor(.cyan) }
    var white : String { forgroundColor(.white) }
    var brightBlack : String { forgroundColor(.black, true) }
    var brightRed : String { forgroundColor(.red, true) }
    var brightGreen : String { forgroundColor(.green, true) }
    var brightYellow : String { forgroundColor(.yellow, true) }
    var brightBlue : String { forgroundColor(.blue, true) }
    var brightMagenta : String { forgroundColor(.magenta, true) }
    var brightCyan : String { forgroundColor(.cyan, true) }
    var brightWhite : String { forgroundColor(.white, true) }

    func color(_ value:UInt8) -> String {
        guard !isEmpty else { return self }
        var output = csi + "8;5;\(value)m" + self
        if !hasSuffix(csi + "\(ANSIAttribute.Style.default.value)m") {
            output.append(csi + "\(ANSIAttribute.Style.default.value)m")
        }
        return output
    }

    // applies specified color to forground of String
    private func forgroundColor(_ color:ANSIAttribute.Color, _ bright:Bool = false) -> String {
        guard !isEmpty else { return self }
        var output = csi
        if bright {
            output.append("\(color.value.brighten)m" + self)
        } else {
            output.append("\(color.value)m" + self)
        }
        if !hasSuffix(csi + "\(ANSIAttribute.Style.default.value)m") {
            output.append(csi + "\(ANSIAttribute.Style.default.value)m")
        }
        return output
    }

    // text background coloring
    var onBlack : String { backgroundColor(.black) }
    var onRed : String { backgroundColor(.red) }
    var onGreen : String { backgroundColor(.green) }
    var onYellow : String { backgroundColor(.yellow) }
    var onBlue : String { backgroundColor(.blue) }
    var onMagenta : String { backgroundColor(.magenta) }
    var onCyan : String { backgroundColor(.cyan) }
    var onWhite : String { backgroundColor(.white) }
    var onBrightBlack : String { backgroundColor(.black, true) }
    var onBrightRed : String { backgroundColor(.red, true) }
    var onBrightGreen : String { backgroundColor(.green, true) }
    var onBrightYellow : String { backgroundColor(.yellow, true) }
    var onBrightBlue : String { backgroundColor(.blue, true) }
    var onBrightMagenta : String { backgroundColor(.magenta, true) }
    var onBrightCyan :String { backgroundColor(.cyan, true) }
    var onBrightWhite : String { backgroundColor(.white, true) }

    func onColor(_ value:UInt8) -> String {
        guard !isEmpty else { return self }
        var output = csi + "8;5;\(value)m" + self
        if !hasSuffix(csi + "\(ANSIAttribute.Style.default.value)m") {
            output.append(csi + "\(ANSIAttribute.Style.default.value)m")
        }
        return output
    }

    // applies specified color to background of String
    private func backgroundColor(_ color:ANSIAttribute.Color, _ makeBright:Bool = false) -> String {
        guard !isEmpty else { return self }
        var output = csi
        if makeBright {
            output.append("\(color.backgroundValue.brighten)m" + self)
        } else {
            output.append("\(color.backgroundValue)m" + self)
        }
        if !hasSuffix(csi + "\(ANSIAttribute.Style.default.value)m") {
            output.append(csi + "\(ANSIAttribute.Style.default.value)m")
        }
        return output
    }

    var stripAttributes : String {
        guard !isEmpty else { return self }
        // ANSI Attributes always start with esc and end with m
        var output = split(separator:esc)
        for (index, string) in output.enumerated() {
            if let end = string.firstIndex(of:"m") {
                output[index] = string[string.index(after:end)...]
            }
        }
        return output.joined()
    }
}
