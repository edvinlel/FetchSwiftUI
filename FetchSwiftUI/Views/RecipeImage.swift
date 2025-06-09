//
//  RecipeImage.swift
//  FetchSwiftUI
//
//  Created by Edvin on 6/8/25.
//

import SwiftUI

struct RecipeImage: View {
    let url: URL?
    
    var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped()
                
        } placeholder: {
            Image(systemName: "fork.knife")
                .frame(width: 50, height: 50, alignment: .center)
        }
    }
}

#Preview {
    RecipeImage(url: URL(string: ""))
}
