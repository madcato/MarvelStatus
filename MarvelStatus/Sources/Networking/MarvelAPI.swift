//
//  MarvelAPI.swift
//  MarvelStatus
//
//  Created by Daniel Vela on 10/8/25.
//

import Foundation
import CommonCrypto

class MarvelAPI {
    private let publicKey = "<your api key>"
    private let privateKey = "<private key>"
    private let baseURL = "https://gateway.marvel.com/v1/public/comics"

    func fetchComics() async throws -> [Comic] {
        let ts = String(Int(Date().timeIntervalSince1970))
        let challenge = ts + privateKey + publicKey
        let hash = md5(string: challenge)

        print(challenge)
        print(hash)
        
        var components = URLComponents(string: baseURL)!
        components.queryItems = [
            URLQueryItem(name: "ts", value: ts),
            URLQueryItem(name: "apikey", value: publicKey),
            URLQueryItem(name: "hash", value: hash),
            URLQueryItem(name: "limit", value: "50")  // Limit to 50 for demo
        ]
        
        guard let url = components.url else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.setValue("*/*", forHTTPHeaderField: "Accept")

        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let decoder = JSONDecoder()
        let marvelResponse = try decoder.decode(MarvelResponse.self, from: data)
        return marvelResponse.data.results
    }
}
