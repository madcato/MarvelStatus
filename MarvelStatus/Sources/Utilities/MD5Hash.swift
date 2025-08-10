//
//  MD5Hash.swift
//  MarvelStatus
//
//  Created by Daniel Vela on 10/8/25.
//
import Foundation

func md5(string: String) -> String {
    let data = Data(string.utf8)
    var hash = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
    data.withUnsafeBytes {
        _ = CC_MD5($0.baseAddress, CC_LONG(data.count), &hash)  // CC_MD5 is deprecated but needed for Marvel Comics API access
    }
    return hash.map { String(format: "%02x", $0) }.joined()
}
