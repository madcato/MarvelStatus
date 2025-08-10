//
//  ComicsViewModels.swift
//  MarvelStatus
//
//  Created by Daniel Vela on 10/8/25.
//

import SwiftUI

@MainActor
class ComicsViewModel: ObservableObject {
    @Published var groupedComics: [String: [Comic]] = [:]
    @Published var error: Error?
    
    private let api = MarvelAPI()
    
    func loadComics() async {
        do {
            let comics = try await api.fetchComics()
            var groups: [String: [Comic]] = [:]
            for comic in comics {
                for creator in comic.creators.items {
                    groups[creator.name, default: []].append(comic)
                }
            }
            self.groupedComics = groups.sorted(by: { $0.key < $1.key }).reduce(into: [:]) { $0[$1.key] = $1.value }
        } catch {
            self.error = error
            // TODO: Log error complete information
        }
    }
}
