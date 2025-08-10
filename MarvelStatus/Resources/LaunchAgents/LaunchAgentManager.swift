//
//  InstallLaunchPlist.swift
//  MarvelStatus
//
//  Created by Daniel Vela on 10/8/25.
//

import Foundation

/// Execute this script to install the launch plist file () into ~/Library/LaunchAgents/
/// Load with launchctl load ~/Library/LaunchAgents/com.yourdomain.MarvelComicsBar.plist via Process.
/// 

func installLaunchAgent() {
    Logger.debug("Installing LaunchAgent.")
    
    let plistContent = """
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
        <key>Label</key>
        <string>org.veladan.MarvelStatus</string>
        <key>ProgramArguments</key>
        <array>
            <string>/Applications/MarvelStatus.app/Contents/MacOS/MarvelStatus</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <true/>
    </dict>
    </plist>
    """

    let launchAgentsURL = FileManager.default.homeDirectoryForCurrentUser
        .appendingPathComponent("Library")
        .appendingPathComponent("LaunchAgents")
    
    let plistURL = launchAgentsURL.appendingPathComponent("org.veladan.MarvelStatus.plist")
    
    do {
        // Create LaunchAgents directory if it doesn't exist
        try FileManager.default.createDirectory(at: launchAgentsURL, withIntermediateDirectories: true, attributes: nil)
        
        // Write the plist content to the file
        try plistContent.write(to: plistURL, atomically: true, encoding: .utf8)
        
        // Load the LaunchAgent using launchctl
        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/bin/launchctl")
        process.arguments = ["bootstrap", "gui/\(NSUserName())", plistURL.path]
        
        try process.run()
        process.waitUntilExit()
        
        if process.terminationStatus == 0 {
            Logger.debug("LaunchAgent installed and loaded successfully.")
        } else {
            Logger.warning("Failed to load LaunchAgent.")
        }
    } catch {
        Logger.error("Failed to install LaunchAgent: \(error.localizedDescription)")
    }
}

