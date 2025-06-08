//
//  NetworkManager.swift
//  FetchSwiftUI
//
//  Created by Edvin on 6/6/25.
//

import Foundation

struct NetworkClient {
    static func fetchRecipes(from urlString: String) async throws -> [Recipe] {
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL(urlString)
        }
        
        do {
            async let (data, response) = URLSession.shared.data(from: url)
            
            guard let httpResponse = try await response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                throw NetworkError.invalidStatusCode(httpResponse.statusCode)
            }
            
            do {
                let decoded = try await JSONDecoder().decode(Response.self, from: data)
                return decoded.recipes
            } catch {
                throw NetworkError.decodingFailed(error)
            }
        } catch {
            throw NetworkError.requestFailed(error)
        }
    }
}

// Found a few Network errors you can come across online, so I wanted to integrate it to the app.
// I know the app won't need so many checks, but it is nice to have.
enum NetworkError: Error {
    case invalidURL(String)
    case invalidStatusCode(Int)
    case invalidResponse
    case decodingFailed(Error)
    case requestFailed(Error)
    
    var localizedDescription: String {
        switch self {
        case .invalidURL(let urlString):
            return "Invalid URL: \(urlString)"
        case .requestFailed(let error):
            return "Network request failed: \(error.localizedDescription)"
        case .invalidResponse:
            return "Invalid response from server."
        case .invalidStatusCode(let statusCode):
            return "Bad status code: \(statusCode)"
        case .decodingFailed(let error):
            return "Failed to decode data: \(error.localizedDescription)"
        }
    }
}

extension String {
    func asURL() -> URL? {
        guard let url = URL(string: self) else {
            return nil
        }
        
        return url
    }
}
