//
//  ViewModelBase.swift
//  Movies App
//
//  Created by Pablo Aguirre on 16/07/24.
//

import Foundation

enum LoadingState {
    case none
    case success
    case failed
    case loading
}

@Observable
class ViewModelBase {
    var loadingState: LoadingState = .none
}
