//
//  Playlist.swift
//  Spotify
//
//  Created by Saad Sherif on 3/3/21.
//

import Foundation

struct Playlist: Codable {
    let description: String
    let external_urls: [String: String]
    let id: String
    let images: [APIImage]
    let name: String
    let owner: User
}
