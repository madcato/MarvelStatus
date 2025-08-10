//
//  MarvelComicsBarTests.swift
//  MarvelComicsBarTests
//
//  Created by Daniel Vela on 10/8/25.
//

import XCTest
@testable import MarvelComicsBar

final class MarvelAPITests: XCTestCase {
    func testFetchComics() async throws {
        let api = MarvelAPI()
        let comics = try await api.fetchComics()
        XCTAssertFalse(comics.isEmpty, "Should fetch some comics")
    }
}
