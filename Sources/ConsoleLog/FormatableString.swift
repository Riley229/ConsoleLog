// Allows ANSIFormatting to be applied to a String
public extension String {
    func forground(_ color:ANSIFormat.Color) -> String {
        return color.forground + self.checkForDefault()
    }

    func background(_ color:ANSIFormat.Color) -> String {
        return color.background + self.checkForDefault()
    }

    func bold() -> String {
        return ANSIFormat.bold + self.checkForDefault()
    }

    func underline() -> String {
        return ANSIFormat.underline + self.checkForDefault()
    }

    func reversed() -> String {
        return ANSIFormat.reversed + self.checkForDefault()
    }

    // Checks for ANSICodes.default at end of String to avoid duplications
    private func checkForDefault() -> String {
        if self.hasSuffix(ANSIFormat.default) {
            return self
        } else {
            return self + ANSIFormat.default
        }
    }
}
