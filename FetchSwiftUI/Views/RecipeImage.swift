//
//  RecipeImage.swift
//  FetchSwiftUI
//
//  Created by Edvin on 6/8/25.
//

import SwiftUI

struct RecipeImage: View {
    let url: URL?
    
    var body: some View {
        if let url = url {
            CacheAsyncImage(url: url) { phase in
                switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                    
                    // I do not like the way this is setup and I would like to implement the ErrorView and try again, but I have used
                    // up so much time as it is.
                    case .failure(_):
                        Image(systemName: "questionmark")
                    @unknown default:
                        Image(systemName: "questionmark")
                }
            }
        } else {
            Image(systemName: "questionmark")
        }
    }
}

#Preview {
    RecipeImage(url: URL(string: ""))
}
