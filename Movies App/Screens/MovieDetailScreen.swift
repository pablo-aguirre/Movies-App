//
//  MovieDetailScreen.swift
//  Movies App
//
//  Created by Pablo Aguirre on 17/07/24.
//

import SwiftUI

struct MovieDetailScreen: View {
    let imdbId: String
    var movieDetailVM = MovieDetailViewModel()
    
    var body: some View {
        VStack {
            if movieDetailVM.loadingState == .loading {
                LoadingView()
            } else if movieDetailVM.loadingState == .success {
                MovieDetailView(movieDetailVM: movieDetailVM)
            } else if movieDetailVM.loadingState == .failed {
                FailedView()
            }
        }.onAppear {
            movieDetailVM.getDetailsByImdbId(imdbId: imdbId)
        }
    }
}
