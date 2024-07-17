//
//  MovieDetailViewModel.swift
//  Movies App
//
//  Created by Pablo Aguirre on 17/07/24.
//

import Foundation

@Observable
class MovieDetailViewModel {
    private var movieDetail: MovieDetail?
    private var httpClient = HTTPClient()
    var loadingState = LoadingState.loading
    
    init(movieDetail: MovieDetail? = nil) {
        self.movieDetail = movieDetail
    }
    
    func getDetailsByImdbId(imdbId: String) {
        httpClient.getMovieDetailsBy(imdbID: imdbId) { result in
            switch result {
            case .success(let details):
                DispatchQueue.main.async {
                    self.movieDetail = details
                    self.loadingState = .success
                }
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.loadingState = .failed
                }
            }
        }
    }
    
    var title: String {
        movieDetail?.title ?? ""
    }
    
    var poster: String {
        movieDetail?.poster ?? ""
    }
    
    var plot: String {
        movieDetail?.plot ?? ""
    }
    
    var rating: Int {
        get {
            let ratingAsDouble = Double(movieDetail?.imdbRating ?? "0.0")
            return Int(ceil(ratingAsDouble ?? 0.0))
        }
    }
    
    var director: String {
        movieDetail?.director ?? ""
    }
    
}
