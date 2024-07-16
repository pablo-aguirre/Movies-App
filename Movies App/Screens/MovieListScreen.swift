//
//  MovieListScreen.swift
//  Movies App
//
//  Created by Pablo Aguirre on 16/07/24.
//

import SwiftUI

struct MovieListScreen: View {
    private var movieListVM: MovieListViewModel
    
    init() {
        self.movieListVM = MovieListViewModel()
        self.movieListVM.searchByName("batman")
    }
    
    var body: some View {
        VStack {
            MovieListView(movies: movieListVM.movies)
                .navigationTitle("Movies")
        }.embedNavigationView()
    }
}

#Preview {
    MovieListScreen()
}
