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

/// Stores all of the methods for cursor manipulation.
public class Cursor {
    /// Moves cursor up while maintaining column position.
    /// - Parameter lines: The number of lines to move up (default is 1).
    static public func moveUp(_ lines: Int = 1) {
        apply(command: "A", arguments: lines)
    }

    /// Moves cursor down while maintaining column position.
    /// - Parameter lines: The number of lines to move down (default is 1).
    static public func moveDown(_ lines: Int = 1) {
        apply(command: "B", arguments: lines)
    }

    /// Moves cursor forward while maintining line position.
    /// - Parameter columns: The number of columns to move forward (default is 1).
    static public func moveForward(_ columns: Int = 1) {
        apply(command: "C", arguments: columns)
    }

    /// Moves cursor backwards while maintaining line position.
    /// - Parameter: columns: The number of columns to move backwards (default is 1).
    static public func moveBackward(_ columns: Int = 1) {
        apply(command: "D", arguments: columns)
    }

    /// Moves cursor up while resetting column position to 0.
    /// - Parameter lines: The number of lines to move up (default is 1).
    static public func moveUpLine(_ lines: Int = 1) {
        apply(command: "E", arguments: lines)
    }

    /// Moves cursor down while resetting column position to 0.
    /// - Parameter lines: The number of lines to move down (default is 1).
    static public func moveDownLine(_ lines: Int = 1) {
        apply(command: "F", arguments: lines)
    }

    /**
     Moves cursor to specified line and column.
     - Parameters:
       - line: The line to move to.
       - column: The column to move to.
     */
    public static func setPosition(line: Int, column: Int) {
        apply(command: "H", arguments: line, column)
    }

    /// Saves the current cursor position.
    static public func savePosition() {
        apply(command: "s")
    }

    /// Restores the saved cursor position.
    static public func restorePosition() {
        apply(command: "u")
    }

   /**
    Builds string for cursor commands and applies to terminal.
    - Parameters:
      - command: The character representing the desired command
      - arguments: The arguments for desired command.
    */
    static func apply(command: Character, arguments: Int...) {
        var sequence = csi
        for (index, argument) in arguments.enumerated() {
            if index != 0 {
                sequence.append(";")
            }
            sequence.append("\(argument)")
        }
        sequence.append(command)
        print(sequence, terminator: "")
    }
}
