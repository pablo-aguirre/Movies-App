//
//  String+Extensions.swift
//  Movies App
//
//  Created by Pablo Aguirre on 16/07/24.
//

import Foundation

extension String {
    
    func trimmedAndEscaped() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
    
}
