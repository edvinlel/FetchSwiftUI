//
//  RecipeViewModel.swift
//  FetchSwiftUI
//
//  Created by Edvin on 6/6/25.
//

import Foundation

final class RecipeViewModel {
    private let recipe: Recipe
    
    init(recipe: Recipe) {
        self.recipe = recipe
    }
    
    var photoLargeAsURL: URL? {
        URL(string: recipe.photoUrlLarge)
    }
    
    var photoSmallAsURL: URL? {
        URL(string: recipe.photoUrlSmall)
    }
    
    var webSourceAsURL: URL? {
        URL(string: recipe.sourceUrl)
    }
    
    var youtubeSourceAsURL: URL? {
        URL(string: recipe.youtubeUrl)
    }
}
