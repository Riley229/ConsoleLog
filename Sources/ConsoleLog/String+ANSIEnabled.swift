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


extension String : ANSIEnabled {
    public func forground(_ color:ANSI.Color) -> String {
        generate(ANSI.forgroundColor(color))
    }

    public func background(_ color:ANSI.Color) -> String {
        generate(ANSI.backgroundColor(color))
    }

    public func bold() -> String {
        generate(ANSI.formatText(.bold))
    }

    public func faint() -> String {
        generate(ANSI.formatText(.faint))
    }

    public func italic() -> String {
        generate(ANSI.formatText(.italic))
    }

    public func underline() -> String {
        generate(ANSI.formatText(.underline))
    }

    public func blinkSlow() -> String {
        generate(ANSI.formatText(.blinkSlow))
    }

    public func blinkFast() -> String {
        generate(ANSI.formatText(.blinkFast))
    }

    public func reversed() -> String {
        generate(ANSI.formatText(.reversed))
    }

    public func conceal() -> String {
        generate(ANSI.formatText(.conceal))
    }

    public func strikethrough() -> String {
        generate(ANSI.formatText(.strikethrough))
    }

    public func underlineDouble() -> String {
        generate(ANSI.formatText(.underlineDouble))
    }

    // Adds ANSI command and checks for reset at end
    private func generate(_ command:String) -> String {
        var output = String()
        output.append(command)
        output.append(self)
        if !self.hasSuffix(ANSI.formatText(.reset)) {
            output.append(ANSI.formatText(.reset))
        }
        return output
    }
}
