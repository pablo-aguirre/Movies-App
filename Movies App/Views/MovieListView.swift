//
//  MovieListView.swift
//  Movies App
//
//  Created by Pablo Aguirre on 16/07/24.
//

import SwiftUI

struct MovieListView: View {
    let movies: [MovieViewModel]
    
    var body: some View {
        List(self.movies, id: \.imdbId) { movie in
            NavigationLink(destination: MovieDetailScreen(imdbId: movie.imdbId)) {
                MovieCellView(movie: movie)
            }
        }
    }
}

struct MovieCellView: View {
    let movie: MovieViewModel
    
    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: URL(string: movie.poster), content: { $0.resizable() }, placeholder: { ProgressView() })
                .frame(width: 100, height: 120)
                .clipShape(.rect(cornerRadius: 6))
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.headline)
                Text(movie.year)
                    .opacity(0.5)
                    .padding(.top, 10)
            }
            Spacer()
        }
    }
}
    