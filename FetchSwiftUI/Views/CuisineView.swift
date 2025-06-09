//
//  CuisineView.swift
//  FetchSwiftUI
//
//  Created by Edvin on 6/6/25.
//

import SwiftUI

struct CuisineView: View {
    let emojiFlag: String
    let cuisine: String
    let viewModel: RecipeListViewModel
    
    var body: some View {
        NavigationLink {
            CuisineList(cuisine: cuisine, viewModel: viewModel)
        } label: {
            VStack {
                Text(emojiFlag)
                    .font(.system(size: 40))
                Text(cuisine)
                    .fontWeight(.semibold)
                    .padding(.bottom, 5)
                    .foregroundStyle(.black)
            }
            .frame(width: 140, height: 110)
            .background(
                RoundedRectangle(cornerRadius: 12.0)
                    .fill(Color.white)
            )
        }
    }
}

#Preview {
    CuisineView(emojiFlag: "🇺🇸", cuisine: "American", viewModel: RecipeListViewModel())
}
