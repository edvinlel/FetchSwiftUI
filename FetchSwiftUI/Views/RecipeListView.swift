//
//  ContentView.swift
//  FetchSwiftUI
//
//  Created by Edvin on 6/6/25.
//

import SwiftUI

struct RecipeListView: View {
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
                            
                        }
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .padding(.top, 45)
            }
            .navigationTitle("Recipes")
            .background(Color(.systemGray6))
        }
        
    }
}

#Preview {
    RecipeListView()
}
