//
//  Logger.swift
//  MarvelStatus
//
//  Created by Daniel Vela on 10/8/25.
//

import os.log

struct Logger {
    private static let subsystem = "org.veladan.MarvelStatus"
    private static let log = OSLog(subsystem: subsystem, category: "app")

    static func error(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        os_log(.error, log: log, "[ERROR] %s (%s:%d - %s)", message, file, line, function)
    }

    static func warning(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        os_log(.default, log: log, "[WARNING] %s (%s:%d - %s)", message, file, line, function)
    }

    // Optional: Add debug or info logs if needed
    static func debug(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
#if DEBUG
        os_log(.debug, log: log, "[DEBUG] %s (%s:%d - %s)", message, file, line, function)
#endif
    }
}

