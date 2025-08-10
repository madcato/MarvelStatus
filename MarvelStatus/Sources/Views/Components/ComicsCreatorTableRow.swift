//
//  ComicsCreatorTableRow.swift
//  MarvelStatus
//
//  Created by Daniel Vela on 10/8/25.
//

import SwiftUI

struct ComicsCreatorTableRow: View {
    let comic: Comic
    
    var body: some View {
        NavigationLink(destination: ComicDetailView(comic: comic)) {
            HStack {
                if let url = comic.thumbnail?.url {
                    AsyncImage(url: url) { image in
                        image.resizable().frame(width: 50, height: 50)
                    } placeholder: {
                        ProgressView()
                    }
                }
                Text(comic.title)
            }
        }
    }
}
