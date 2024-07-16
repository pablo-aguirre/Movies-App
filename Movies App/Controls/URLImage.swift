//
//  URLImage.swift
//  Movies App
//
//  Created by Pablo Aguirre on 16/07/24.
//

import SwiftUI

struct URLImage: View {
    let url: String
    let placeHolder: String
    var imageLoader = ImageLoader()
    
    init(url: String, placeHolder: String = "placeholder") {
        self.url = url
        self.placeHolder = placeHolder
        self.imageLoader.downloadImage(url: self.url)
    }
    
    var body: some View {
        if let data = self.imageLoader.downloadedData {
            return Image(uiImage: .init(data: data)!).resizable()
        } else {
            return Image("placeholder").resizable()
        }
    }
}
