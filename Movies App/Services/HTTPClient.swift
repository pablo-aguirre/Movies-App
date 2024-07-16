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
    
    func getMoviewBy(search: String, completion: @escaping (Result<[Movie]?, NetworkError>) -> Void)  {
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(search)&apikey=\(Constants.API_KEY)") else { return completion(.failure(.badURL)) }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return completion(.failure(.noData)) }
            guard let moviesRespons = try? JSONDecoder().decode(MovieResponse.self, from: data) else { return completion(.failure(.decodingError)) }
            
            completion(.success(moviesRespons.movies))
        }.resume()
    }
}
