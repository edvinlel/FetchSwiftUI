//
//  Recipe.swift
//  FetchSwiftUI
//
//  Created by Edvin on 6/6/25.
//

import Foundation

struct Recipe: Decodable {
    var cuisine: String
    var name: String
    var photoUrlLarge: String
    var photoUrlSmall: String
    var sourceUrl: String
    var uuid: String
    var youtubeUrl: String
    
    enum CodingKeys: String, CodingKey {
        case photoUrlLarge = "photo_url_large"
        case photoUrlSmall = "photo_url_small"
        case sourceUrl = "source_url"
        case youtubeUrl = "youtube_url"
        case uuid, cuisine, name
    }
    
    var photoLargeAsURL: URL? {
        URL(string: photoUrlLarge)
    }
    
    var photoSmallAsURL: URL? {
        URL(string: photoUrlSmall)
    }
    
    var webSourceAsURL: URL? {
        URL(string: sourceUrl)
    }
    
    var youtubeSourceAsURL: URL? {
        URL(string: youtubeUrl)
    }
}

enum CuisineFlags: String {
    case malaysian = "🇲🇾"
    case british = "🇬🇧"
    case american = "🇺🇸"
    case canadian = "🇨🇦"
    case italian = "🇮🇹"
    case tunisian = "🇹🇳"
    case french = "🇫🇷"
    case greek = "🇬🇷"
    case polish = "🇵🇱"
    case portuguese = "🇵🇹"
    case russian = "🇷🇺"
    case croatian = "🇭🇷"
}
