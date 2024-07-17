//
//  MovieDetailView.swift
//  Movies App
//
//  Created by Pablo Aguirre on 17/07/24.
//

import SwiftUI

struct MovieDetailView: View {
    
    let movieDetailVM: MovieDetailViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Spacer()
                    AsyncImage(url: URL(string: movieDetailVM.poster))
                        .clipShape(.rect(cornerRadius: 10))
                    Spacer()
                }
                Text(movieDetailVM.title)
                    .font(.title)
                Text(movieDetailVM.plot)
                Text("Director").fontWeight(.bold)
                Text(movieDetailVM.director)
                HStack {
                    Rating(rating: .constant(movieDetailVM.rating))
                    Text("\(movieDetailVM.rating)/10")
                }
            }
            .padding()
            .navigationTitle(movieDetailVM.title)
        }
    }
}
