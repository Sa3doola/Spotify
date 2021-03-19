//
//  SearchResult.swift
//  Spotify
//
//  Created by Saad Sherif on 3/16/21.
//

import Foundation

struct SearchResultResponse: Codable {
    let albums: SearchAlbumResponse
    let playlists: SearchPlaylistResponse
    let artists: SearchArtistsResponse
    let tracks: SearchTracksResponse
}

struct SearchAlbumResponse: Codable {
    let items: [Album]
}

struct SearchPlaylistResponse: Codable {
    let items: [Playlist]
}

struct SearchArtistsResponse: Codable {
    let items: [Artist]
}

struct SearchTracksResponse: Codable {
    let items: [AudioTrack]
}
