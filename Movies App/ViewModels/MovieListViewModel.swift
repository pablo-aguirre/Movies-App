//
//  MovieListViewModel.swift
//  Movies App
//
//  Created by Pablo Aguirre on 16/07/24.
//

import Foundation
import SwiftUI

@Observable
class MovieListViewModel {
    var movies = [MovieViewModel]()
    private let httpClient = HTTPClient()
    
    func searchByName(_ name: String) {
        httpClient.getMoviewBy(search: name) { result in
            switch result {
            case .success(let movies):
                if let movies = movies {
                    DispatchQueue.main.async {
                        self.movies = movies.map{ MovieViewModel.init(movie: $0) }
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
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
