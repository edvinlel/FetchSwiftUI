//
//  CuisineList.swift
//  FetchSwiftUI
//
//  Created by Edvin on 6/9/25.
//

import SwiftUI

struct CuisineList: View {
    let cuisine: String
    let viewModel: RecipeListViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                RecipeList(recipeViewModel: viewModel.getRecipe(for: cuisine))
            }
        }
        .navigationTitle(cuisine)
    }
}

#Preview {
    CuisineList(cuisine: "American", viewModel: RecipeListViewModel())
}
