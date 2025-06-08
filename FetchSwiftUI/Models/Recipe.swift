//
//  Recipe.swift
//  FetchSwiftUI
//
//  Created by Edvin on 6/6/25.
//

import Foundation

struct Response: Codable {
    let recipes: [Recipe]
}

struct Recipe: Codable, Identifiable {
    let cuisine: String
    let name: String
    let photoUrlLarge: String?
    let photoUrlSmall: String?
    let sourceUrl: String?
    let uuid: UUID
    let youtubeUrl: String?
    
    var id: UUID { uuid }
    
    enum CodingKeys: String, CodingKey {
        case photoUrlLarge = "photo_url_large"
        case photoUrlSmall = "photo_url_small"
        case sourceUrl = "source_url"
        case youtubeUrl = "youtube_url"
        case uuid, cuisine, name
    }
    
    init(cuisine: String, name: String, photoUrlLarge: String?, photoUrlSmall: String?, sourceUrl: String?, uuid: UUID, youtubeUrl: String?) {
        self.cuisine = cuisine
        self.name = name
        self.photoUrlLarge = photoUrlLarge
        self.photoUrlSmall = photoUrlSmall
        self.sourceUrl = sourceUrl
        self.uuid = uuid
        self.youtubeUrl = youtubeUrl
    }
}

extension String {
    var cuisineFlag: String {
        switch self {
        case "Malaysian": return "🇲🇾"
        case "British": return "🇬🇧"
        case "American": return "🇺🇸"
        case "Canadian": return "🇨🇦"
        case "Italian": return "🇮🇹"
        case "Tunisian": return "🇹🇳"
        case "French": return "🇫🇷"
        case "Greek": return "🇬🇷"
        case "Polish": return "🇵🇱"
        case "Portuguese": return "🇵🇹"
        case "Russian": return "🇷🇺"
        case "Croatian": return "🇭🇷"
        default: return "🏳️" 
        }
    }
}
