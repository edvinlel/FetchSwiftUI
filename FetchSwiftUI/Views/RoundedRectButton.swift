//
//  RoundedRectButton.swift
//  FetchSwiftUI
//
//  Created by Edvin on 6/9/25.
//

import SwiftUI

struct RoundedRectButton: View {
    @Environment(\.openURL) var openURL
    let recipe: Recipe
    let buttonText: String
    let url: URL?
    
    var body: some View {
        if let url = url {
            Button {
                openURL(url)
            } label: {
                Text(buttonText)
                    .foregroundStyle(.black)
                    .font(.title)
            }
            .buttonStyle(.bordered)
        }
        
    }
}

#Preview {
    @Previewable @State var recipe = Recipe(cuisine: "American", name: "Cheeseburger", photoUrlLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/dac510db-fa7f-4bf1-af61-706a9c960455/large.jpg", photoUrlSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/dac510db-fa7f-4bf1-af61-706a9c960455/small.jpg", sourceUrl: nil, uuid: UUID(), youtubeUrl: nil)
    RoundedRectButton(recipe: recipe, buttonText: "Text", url: nil)
}
