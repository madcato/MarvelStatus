//
//  ComicModels.swift
//  MarvelStatus
//
//  Created by Daniel Vela on 10/8/25.
//

import Foundation

struct MarvelResponse: Codable {
    let data: MarvelData
}

struct MarvelData: Codable {
    let results: [Comic]
}

struct Comic: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String?
    let thumbnail: Thumbnail?
    let creators: Creators

    struct Thumbnail: Codable {
        let path: String
        let ext: String
        var url: URL? { URL(string: "\(path).\(ext)") }
    }

    struct Creators: Codable {
        let items: [CreatorItem]
    }

    struct CreatorItem: Codable {
        let name: String
        let role: String
    }
}
