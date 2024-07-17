//
//  HTTPClient.swift
//  Movies App
//
//  Created by Pablo Aguirre on 16/07/24.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case noData
    case decodingError
}

class HTTPClient {
    
    func getMoviesBy(search: String, completion: @escaping (Result<[Movie]?, NetworkError>) -> Void)  {
        guard let url = URL.forMoviesByName(search) else { return completion(.failure(.badURL)) }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return completion(.failure(.noData)) }
            guard let moviesRespons = try? JSONDecoder().decode(MovieResponse.self, from: data) else { return completion(.failure(.decodingError)) }
            
            completion(.success(moviesRespons.movies))
        }.resume()
    }
    
    func getMovieDetailsBy(imdbID: String, completion: @escaping (Result<MovieDetail,NetworkError>) -> Void) {
        guard let url = URL.forMoviesByImdbId(imdbID) else { return  }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return completion(.failure(.noData)) }
            guard let movieDetail = try? JSONDecoder().decode(MovieDetail.self, from: data) else { return completion(.failure(.decodingError)) }
            
            completion(.success(movieDetail))
        }.resume()
    }
}
