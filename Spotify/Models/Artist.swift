//
//  Artist.swift
//  Spotify
//
//  Created by Saad Sherif on 3/3/21.
//

import Foundation

struct Artist: Codable {
    let id: String
    let name: String
    let external_urls: [String: String]
}
