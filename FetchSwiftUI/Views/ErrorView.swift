//
//  ErrorView.swift
//  FetchSwiftUI
//
//  Created by Edvin on 6/6/25.
//

import SwiftUI

struct ErrorView: View {
    let errorMessage: String
    let tryAgainAction: () -> Void
    
    var body: some View {
        Text("Error")
            .fontWeight(.semibold)
        Text(errorMessage)
        Button {
            tryAgainAction()
        } label: {
            Text("Try Again")
                .padding(2)
        }
        .foregroundStyle(.white)
        .buttonStyle(.bordered)
        .background(
            RoundedRectangle(cornerRadius: 8.0)
                .fill(Color.black)
        )
    }
}

#Preview {
    ErrorView(errorMessage: "Error loading data.", tryAgainAction: {
        
    })
}
