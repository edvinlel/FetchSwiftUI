//
//  FetchSwiftUIApp.swift
//  FetchSwiftUI
//
//  Created by Edvin on 6/6/25.
//

import SwiftUI

@main
struct FetchSwiftUIApp: App {
    @StateObject private var viewModel = RecipeListViewModel()
    
    var body: some Scene {
        WindowGroup {
            if viewModel.isInitialLoading {
                ProgressView()
                    .task {
                        await viewModel.fetchRecipes()
                    }
            } else if let errorMessage = viewModel.errorMessage {
                ErrorView(errorMessage: errorMessage) {
                    Task {
                        await viewModel.fetchRecipes()
                    }
                }
            } else {
                RecipeListView(viewModel: viewModel)
            }
        }
    }
}
