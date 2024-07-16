//
//  MovieListViewModel.swift
//  Movies App
//
//  Created by Pablo Aguirre on 16/07/24.
//

import Foundation
import SwiftUI

@Observable
class MovieListViewModel: ViewModelBase {
    var movies = [MovieViewModel]()
    private let httpClient = HTTPClient()
    
    func searchByName(_ name: String) {
        guard !name.isEmpty else { return }
        
        self.loadingState = .loading
        
        httpClient.getMoviewBy(search: name) { result in
            switch result {
            case .success(let movies):
                if let movies = movies {
                    DispatchQueue.main.async {
                        self.movies = movies.map{ MovieViewModel.init(movie: $0) }
                        self.loadingState = .success
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.loadingState = .failed                    
                }
            }
        }
    }
}

struct MovieViewModel {
    let movie: Movie
    
    var imdbId: String {
        movie.imdbID
    }
    
    var title: String {
        movie.title
    }
    
    var poster: String {
        movie.poster
    }
    
    var year: String {
        movie.year
    }
}
