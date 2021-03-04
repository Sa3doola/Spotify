//
//  AuthResponse.swift
//  Spotify
//
//  Created by Saad Sherif on 3/4/21.
//

import Foundation

struct AuthResponse: Codable {
    let access_token: String?
    let expires_in: Int
    let refresh_token: String?
    let scpoe: String?
    let token_type: String?
}

