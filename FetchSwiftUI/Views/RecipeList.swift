//
//  RecipeList.swift
//  FetchSwiftUI
//
//  Created by Edvin on 6/9/25.
//

import SwiftUI

struct RecipeList: View {
    let recipeViewModel: [RecipeViewModel]
    
    var body: some View {
        ForEach(recipeViewModel, id: \.uuid) { recipe in
            NavigationLink {
                RecipeDetailView(recipe: recipe.getRecipe)
            } label: {
                RecipeView(recipe: recipe.getRecipe)
                    .foregroundStyle(Color.black)
                    .padding(.horizontal, 20)
            }
        }
    }
}

#Preview { 
    RecipeList(recipeViewModel: [RecipeViewModel]())
}
