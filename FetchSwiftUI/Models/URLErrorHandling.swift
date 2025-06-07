//
//  URLErrorHandling.swift
//  FetchSwiftUI
//
//  Created by Edvin on 6/6/25.
//

import Foundation

enum NetworkError: Error {
    case invalidURL(String)
    case badStatusCode(Int)
    case noData
    case unkown(Error)
}

extension String {
    func asURL() -> URL? {
        guard let url = URL(string: self) else {
            let _ = NetworkError.invalidURL(self)
            return nil
        }
        
        return url
    }
}
