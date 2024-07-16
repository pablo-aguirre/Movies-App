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
            
            Spacer()
            if self.movieListVM.loadingState == .success {
                MovieListView(movies: movieListVM.movies)
            } else if self.movieListVM.loadingState == .failed {
                FailedView().padding()
            } else if self.movieListVM.loadingState == .loading {
                LoadingView().padding()
            }
        }
        .navigationTitle("Movies")
        .embedNavigationView()
    }
}

#Preview {
    MovieListScreen()
}
