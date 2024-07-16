//
//  ImageLoader.swift
//  Movies App
//
//  Created by Pablo Aguirre on 16/07/24.
//

import Foundation

@Observable
class ImageLoader {
    
     var downloadedData: Data?
    
    func downloadImage(url: String) {
        guard let imageURL = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: imageURL) { data, _, error in
            guard let data = data, error == nil else { return }
            
            DispatchQueue.main.async {
                self.downloadedData = data
            }
        }.resume()
    }
}
