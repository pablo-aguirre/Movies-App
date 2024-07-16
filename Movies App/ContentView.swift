//
//  ContentView.swift
//  Movies App
//
//  Created by Pablo Aguirre on 16/07/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello World!")
            .onAppear {
                HTTPClient().getMoviewBy(search: "batman") { result in
                    switch result {
                    case .success(let movies):
                        print(movies!)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
    }
}

#Preview {
    ContentView()
}
