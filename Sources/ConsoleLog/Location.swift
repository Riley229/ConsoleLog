import Foundation

public struct Location : Hashable, Equatable {
    let file : String
    let function : String
    let line : UInt

    public func printable() -> String {
        // removes `file://` from beginning
        let homeDirectory = FileManager.default.homeDirectoryForCurrentUser.absoluteString.dropFirst(7)
        var file = self.file
        if file.hasPrefix(homeDirectory) {
            file = "~/" + String(file.dropFirst(homeDirectory.count))
        }
        return "\(file):\(line): ".bold()
    }
}
