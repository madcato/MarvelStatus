//
//  AppDelegate.swift
//  MarvelStatus
//
//  Created by Daniel Vela on 10/8/25.
//

import ServiceManagement
import AppKit
import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem?
    var popover: NSPopover?
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        statusItem?.button?.title = "🦸"  // Emoji icon; or use image
        statusItem?.button?.action = #selector(togglePopover)
        
        popover = NSPopover()
        popover?.contentSize = NSSize(width: 400, height: 500)
        popover?.behavior = .transient
        popover?.contentViewController = NSHostingController(rootView: ComicsView())
        
        enableAutoStart()
    }
    
    @objc func togglePopover() {
        if let button = statusItem?.button {
            if popover?.isShown == true {
                popover?.performClose(nil)
            } else {
                popover?.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
            }
        }
    }
    
    /// Call this method to ask user to autostart this application
    private func enableAutoStart() {
        let helperIdentifier = "org.veladan.MarvelStatus"  // Main app bundle ID
        SMLoginItemSetEnabled(helperIdentifier as CFString, true)
        
        installLaunchAgent()
    }
}
