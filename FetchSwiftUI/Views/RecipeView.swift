//
//  RecipeView.swift
//  FetchSwiftUI
//
//  Created by Edvin on 6/7/25.
//

import SwiftUI

struct RecipeView: View {
    let recipe: Recipe
    
    private var youTubeIcon: String {
        recipe.youtubeUrl != nil ? "▶️" : ""
    }
    
    var body: some View {

        ZStack(alignment: .bottomTrailing) {
            HStack(alignment: .top) {
                RecipeImage(url: recipe.photoUrlLarge?.asURL())
                    .frame(width: 150, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 12.0))
                    .padding(.leading, 20)
                    .padding(.top, 15)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(recipe.name)
                        .lineLimit(1)
                        .minimumScaleFactor(0.7)
                        .font(.title3)
                        .bold()
                        .padding(.top, 15)
                    Text(recipe.cuisine.cuisineFlag)
                    Spacer()
                }
                Spacer()
            }
            
            Text(youTubeIcon)
                .font(.system(size: 24))
                .padding(12)
        }
        .frame(height: 150)
            .background(
                RoundedRectangle(cornerRadius: 12.0)
                    .fill(Color.white)
            )
    }
}

#Preview {
    @Previewable @State var recipe = Recipe(cuisine: "American", name: "Cheeseburger", photoUrlLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/dac510db-fa7f-4bf1-af61-706a9c960455/large.jpg", photoUrlSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/dac510db-fa7f-4bf1-af61-706a9c960455/small.jpg", sourceUrl: nil, uuid: UUID(), youtubeUrl: nil)
    
    RecipeView(recipe: recipe)
}
