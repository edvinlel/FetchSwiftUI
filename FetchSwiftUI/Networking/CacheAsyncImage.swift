//
//  CachedAsyncImage.swift
//  FetchSwiftUI
//
//  Created by Edvin on 6/12/25.
//

import SwiftUI

// I was having a hard time finding a way to cache with SwiftUI as it isnt as simple with AsyncImage compared to caching in UIKit.
// I found this tutorial on youtube and used it.

struct CacheAsyncImage<Content>: View where Content: View {
    private let url: URL
    private let scale: CGFloat
    private let transaction: Transaction
    private let content: (AsyncImagePhase) -> Content
    
    init(url: URL, scale: CGFloat = 1.0, transaction: Transaction = Transaction(), @ViewBuilder content: @escaping (AsyncImagePhase) -> Content) {
        self.url = url
        self.scale = scale
        self.transaction = transaction
        self.content = content
    }
    
    var body: some View {
        if let cachedImage = ImageCache[url] {
            content(.success(cachedImage))
        } else {
            AsyncImage(url: url) { phase in
                if case .success(let image) = phase {
                    ImageCache[url] = image
                }
                return content(phase)
            }
        }
    }
}

fileprivate class ImageCache {
    static private var cache: [URL: Image] = [:]
    
    static subscript(url: URL) -> Image? {
        get {
            ImageCache.cache[url]
        }
        set {
            ImageCache.cache[url] = newValue
        }
    }
}
