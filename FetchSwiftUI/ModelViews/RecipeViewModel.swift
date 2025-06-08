//
//  RecipeViewModel.swift
//  FetchSwiftUI
//
//  Created by Edvin on 6/6/25.
//

import Foundation

@MainActor
final class RecipeViewModel: ObservableObject {
    private let recipe: Recipe
    
    init(recipe: Recipe) {
        self.recipe = recipe
    }
    
    var getRecipe: Recipe {
        recipe
    }
    
    var photoLargeAsURL: URL? {
        recipe.photoUrlLarge?.asURL()
    }
    
    var photoSmallAsURL: URL? {
        recipe.photoUrlSmall?.asURL()
    }
    
    var webSourceAsURL: URL? {
        recipe.sourceUrl?.asURL()
    }
    
    var youtubeSourceAsURL: URL? {
        recipe.youtubeUrl?.asURL()
    }
    
    var uuid: UUID {
        recipe.uuid
    }
    
}
