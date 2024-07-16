//
//  Movie.swift
//  Movies App
//
//  Created by Pablo Aguirre on 16/07/24.
//

struct MovieResponse: Codable {
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case movies = "Search"
    }
}


struct Movie: Codable {
    
    let title: String
    let year: String
    let imdbID: String
    let poster: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID = "imdbID"
        case poster = "Poster"
    }
}
