// Allows ANSICodes to be applied to a String
public extension String {
    func forground(_ color:ANSICode.Color) -> String {
        return color.forground + defaultSelf
    }

    func background(_ color:ANSICode.Color) -> String {
        return color.background + defaultSelf
    }

    func bold() -> String {
        return ANSICode.bold + defaultSelf
    }

    func underline() -> String {
        return ANSICode.underline + defaultSelf
    }

    func reversed() -> String {
        return ANSICode.reversed + defaultSelf
    }

    // Checks for ANSICode.default at end of String to avoid duplications
    private var defaultSelf : String {
        if self.hasSuffix(ANSICode.default) {
            return self
        } else {
            return self + ANSICode.default
        }
    }
}
