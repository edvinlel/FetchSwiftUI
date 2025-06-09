//
//  ContentView.swift
//  FetchSwiftUI
//
//  Created by Edvin on 6/6/25.
//

import SwiftUI

struct RecipeListView: View {
    @ObservedObject var viewModel: RecipeListViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Cuisines")
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(viewModel.allCuisines, id: \.self) { cuisine in
                                CuisineView(emojiFlag: cuisine.cuisineFlag, cuisine: cuisine)
                            }
                        }
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                       
                    }
                    .padding(.bottom, 50)
                    
                    ForEach(viewModel.recipeViewModels, id: \.uuid) { recipe in
                        NavigationLink {
                            RecipeDetailView(recipe: recipe.getRecipe)
                        } label: {
                            RecipeView(recipe: recipe.getRecipe)
                                .foregroundStyle(Color.black)
                                .padding(.horizontal, 20)
                        }
                    }
                    
                }
                .padding(.top, 45)
            }
            .navigationTitle("Recipes")
            .background(Color(.systemGray6))
            .onAppear {
                Task {
                    await viewModel.fetchRecipes()
                }
            }
        }
    }
}

#Preview {
    RecipeListView(viewModel: RecipeListViewModel())
}
