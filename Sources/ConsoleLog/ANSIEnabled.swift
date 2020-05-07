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


public protocol ANSIEnabled {
    func forground(_ color:ANSI.Color) -> Self
    func background(_ color:ANSI.Color) -> Self
    func bold() -> Self
    func faint() -> Self
    func underline() -> Self
    func blink() -> Self
    func reversed() -> Self
}
