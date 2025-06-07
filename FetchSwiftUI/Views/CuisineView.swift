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
    
    var body: some View {
        VStack {
            Text(emojiFlag)
                .font(.system(size: 40))
            Text(cuisine)
                .fontWeight(.semibold)
                .padding(.bottom, 5)
        }
        .frame(width: 140, height: 110)
        .background(
            RoundedRectangle(cornerRadius: 12.0)
                .fill(Color.white.opacity(0.2))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(.systemGray4), lineWidth: 2)
                )
            
        )
        
    }
}

#Preview {
    CuisineView(emojiFlag: "🇺🇸", cuisine: "American")
}
