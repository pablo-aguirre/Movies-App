//
//  URL+Extensions.swift
//  Movies App
//
//  Created by Pablo Aguirre on 16/07/24.
//

import Foundation

extension URL {
    
    static func forMoviesByName(_ name: String) -> URL? {
        return URL(string: "https://www.omdbapi.com/?s=\(name)&apikey=\(Constants.API_KEY)")
    }
    
}
