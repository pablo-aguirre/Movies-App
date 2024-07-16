//
//  MovieListScreen.swift
//  Movies App
//
//  Created by Pablo Aguirre on 16/07/24.
//

import SwiftUI

struct MovieListScreen: View {
    private var movieListVM: MovieListViewModel
    @State private var movieName = ""
    
    init() {
        self.movieListVM = MovieListViewModel()
    }
    
    var body: some View {
        VStack {
            TextField("Search", text: $movieName) {
                self.movieListVM.searchByName(movieName)
            }
            .textFieldStyle(.roundedBorder)
            .padding()
            MovieListView(movies: movieListVM.movies)
        }
        .navigationTitle("Movies")
        .embedNavigationView()
    }
}

#Preview {
    MovieListScreen()
}
