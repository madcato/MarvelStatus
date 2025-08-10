//
//  ComicsView.swift
//  MarvelStatus
//
//  Created by Daniel Vela on 10/8/25.
//

import SwiftUI

struct ComicsView: View {
    @StateObject private var viewModel = ComicsViewModel()
    
    var body: some View {
        VStack {
            if let error = viewModel.error {
                Text("Error: \(error.localizedDescription)").foregroundColor(.red)
            } else {
                List {
                    ForEach(viewModel.groupedComics.keys.sorted(), id: \.self) { creator in
                        Section(header: Text(creator)) {
                            ForEach(viewModel.groupedComics[creator] ?? []) { comic in
                                ComicsCreatorTableRow(comic: comic)
                            }
                        }
                    }
                }
            }
        }
        .task {
            await viewModel.loadComics()
        }
        .frame(minWidth: 400, minHeight: 500)
    }
}

struct ComicDetailView: View {
    let comic: Comic
    
    var body: some View {
        VStack {
            if let url = comic.thumbnail?.url {
                AsyncImage(url: url) { image in
                    image.resizable().aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
            }
            Text(comic.title).font(.title)
            Text(comic.description ?? "No description").padding()
        }
        .frame(minWidth: 300, minHeight: 400)
    }
}
