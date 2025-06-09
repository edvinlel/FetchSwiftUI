//
//  RecipeDetailView.swift
//  FetchSwiftUI
//
//  Created by Edvin on 6/8/25.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("\(recipe.cuisine.cuisineFlag) \(recipe.name)")
                    .fontWeight(.bold)
                    .font(.title)
                    .lineLimit(2)
                RecipeImage(url: recipe.photoUrlLarge?.asURL())
                    .frame(width: 350, height: 500)
                    .clipShape(RoundedRectangle(cornerRadius: 12.0))
                
                
                 
                    RoundedRectButton(recipe: recipe, buttonText: "Instructions", url: recipe.sourceUrl?.asURL())
                    
                    RoundedRectButton(recipe: recipe, buttonText: "▶️", url: recipe.youtubeUrl?.asURL())
                
                
            }
            
        }
    }
}

#Preview {
    @Previewable @State var recipe = Recipe(cuisine: "American", name: "Cheeseburger", photoUrlLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/dac510db-fa7f-4bf1-af61-706a9c960455/large.jpg", photoUrlSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/dac510db-fa7f-4bf1-af61-706a9c960455/small.jpg", sourceUrl: nil, uuid: UUID(), youtubeUrl: nil)
    
    RecipeDetailView(recipe: recipe)
}
