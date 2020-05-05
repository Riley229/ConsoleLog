public class ANSICursor {
    static public func up(_ spaces:UInt) -> String {
        "\u{001B}[\(spaces)A"
    }

    static public func down(_ spaces:UInt) -> String {
        "\u{001B}[\(spaces)B"
    }

    static public func right(_ spaces:UInt) -> String {
        "\u{001B}[\(spaces)C"
    }

    static public func left(_ spaces:UInt) -> String {
        "\u{001B}[\(spaces)D"
    }

    static public func nextLine(_ lines:UInt) -> String {
        "\u{001B}[\(lines)E"
    }

    static public func previousLine(_ lines:UInt) -> String {
        "\u{001B}[\(lines)F"
    }

    static public func setColumn(_ column:UInt) -> String {
        "\u{001B}[\(column)G"
    }

    static public func setPosition(row:UInt, column:UInt) -> String {
        "\u{001B}[\(row);\(column)H"
    }

    public enum ClearStyle : Int {
        case toEnd       = 0
        case toBeginning = 1
        case entire      = 2
    }

    static public func clearScreen(_ style:ClearStyle) -> String {
        "\u{001B}[\(style.rawValue)J"
    }

    static public func clearLine(_ style:ClearStyle) -> String {
        "\u{001B}[\(style.rawValue)K"
    }

    static public func savePosition() -> String {
        "\u{001B}[{s}"
    }

    static public func restorePosition() -> String {
        "\u{001B}[{u}"
    }
}
