import ArgumentParser
import Cocoa
import Foundation
import KeyboardShortcuts

@main
struct Main {
    static func main() {
        Sus.main()
    }
}

struct Sus: ParsableCommand {
    @Argument(
        parsing: .postTerminator,
        help: "TODO"
    )
    var spawnCommand: [String]

    static var configuration = CommandConfiguration(
        abstract: "TODO"
    )

    func run() throws {
        let app = NSApplication.shared

        setupHotKeys()

        // Continue running the process in an infinite management cycle
        NotificationCenter.default.addObserver(forName: Process.didTerminateNotification, object: nil, queue: nil) { _ in
            print("Process terminated. Ready to restart.")
        }

        // Start the initial process
        startOrRestartProcess()

        app.run()
    }

    private func setupHotKeys() {
        KeyboardShortcuts.setShortcut(
            .init(.r, modifiers: [.command, .option]),
            for: .restart
        )

        print("Listening on hotkey: \(KeyboardShortcuts.getShortcut(for: .restart)!)")

        KeyboardShortcuts.onKeyUp(for: .restart) {
            print("Hotkey pressed: Restarting process...")
            startOrRestartProcess()
        }
    }

    private func startOrRestartProcess() {
        guard !spawnCommand.isEmpty else {
            print("Error: No command provided to execute.")
            return
        }

        let process = Process()
        process.launchPath = "/usr/bin/env" // Use `env` to find the command in the PATH
        process.arguments = spawnCommand

        process.standardOutput = FileHandle.standardOutput
        process.standardError = FileHandle.standardError
        process.standardInput = FileHandle.standardInput

        process.terminationHandler = { _ in
            print("Process has terminated. Use hotkey to restart.")
        }

        print("$ \(spawnCommand.joined(separator: " "))")
        process.launch()
    }
}

extension KeyboardShortcuts.Name {
    static let restart = Self("restart")
}
