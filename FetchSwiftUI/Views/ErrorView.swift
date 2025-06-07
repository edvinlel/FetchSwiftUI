//
//  ErrorView.swift
//  FetchSwiftUI
//
//  Created by Edvin on 6/6/25.
//

import SwiftUI

struct ErrorView: View {
    var body: some View {
        Text("Error loading data.")
        Button {
            print("button")
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
    ErrorView()
}
