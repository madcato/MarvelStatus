//
//  MarvelStatusApp.swift
//  MarvelStatus
//
//  Created by Daniel Vela on 10/8/25.
//

import ServiceManagement
import SwiftUI

@main
struct MarvelStatusApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
  
    var body: some Scene {
        Settings {}  // Optional for settings if needed
    }
}

/// Call this method to ask user to autostart this application
func enableAutoStart() {
    let helperIdentifier = "org.veladan.MarvelStatus"  // Main app bundle ID
    SMLoginItemSetEnabled(helperIdentifier as CFString, true)
}
