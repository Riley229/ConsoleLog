public class ANSIFormat {
    // unformatted text (aka reset)
    static public var `default` : String {
        "\u{001B}[0m"
    }

    static public var bold : String {
        "\u{001B}[1m"
    }

    static public var underline : String {
        "\u{001B}[4m"
    }

    static public var reversed : String {
        "\u{001B}[7m"
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
            "\u{001B}[3\(self.rawValue)m"
        }
        
        public var background : String {
            "\u{001B}[4\(self.rawValue)m"
        }
    }
}
