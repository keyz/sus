import Cocoa
import Foundation
import KeyboardShortcuts

@main
struct Main {
    static func main() {
        let app = NSApplication.shared

        KeyboardShortcuts.setShortcut(
            .init(.r, modifiers: [.command, .option]),
            for: .restart
        )

        KeyboardShortcuts.onKeyUp(for: .restart, action: {
            print("hot key pressed: restart")
            app.stop(nil)
        })

        print("listening...")
        app.run()
    }
}

extension KeyboardShortcuts.Name {
    static let restart = Self("restart")
}
