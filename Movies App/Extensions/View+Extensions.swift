//
//  View+Extensions.swift
//  Movies App
//
//  Created by Pablo Aguirre on 16/07/24.
//

import Foundation
import SwiftUI

extension View {
    
    func embedNavigationView() -> some View {
        return NavigationStack { self }
    }
    
}
