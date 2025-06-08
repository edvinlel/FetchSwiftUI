//
//  RecipeListViewModel.swift
//  FetchSwiftUI
//
//  Created by Edvin on 6/6/25.
//

import Foundation

@MainActor
class RecipeListViewModel: ObservableObject {
    @Published var recipeViewModels: [RecipeViewModel] = []
    @Published var allCuisines: [String] = []
    
    // This will be for the initial loading screen. We will show a progress bar for the loading and If we do get an error, an error view will show instead of the main view
    // where the user can try again
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var isInitialLoading = true
    
    private let apiUrlString = "https://d3jbb8n5wk0qxi.cloudfront.net/"
    
    func fetchRecipes() async {
        errorMessage = nil
        isLoading = true
        
        do {
            let fetchedRecipes = try await NetworkClient.fetchRecipes(from: apiUrlString)
            recipeViewModels = fetchedRecipes.map { RecipeViewModel(recipe: $0) }
            
            // Store Cuisines in its own array for the LazyHStack
            let filteredCuisines = fetchedRecipes.map { $0.cuisine }
            for cuisine in filteredCuisines {
                if !allCuisines.contains(cuisine) {
                    allCuisines.append(cuisine)
                }
            }
            
            isInitialLoading = false
        } catch {
            if let networkError = error as? NetworkError {
                errorMessage = networkError.localizedDescription
            } else {
                errorMessage = error.localizedDescription
            }
            isInitialLoading = false
        }
        isLoading = false
    }
    
    func getRecipe(for cuisine: String) -> [RecipeViewModel] {
        return recipeViewModels.filter { $0.getRecipe.cuisine == cuisine }
    }
    
}
