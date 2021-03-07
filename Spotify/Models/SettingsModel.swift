//
//  SettingsModel.swift
//  Spotify
//
//  Created by Saad Sherif on 3/7/21.
//

import Foundation

struct Section {
    let title: String
    let options: [Option]
}

struct Option {
    let title: String
    let handler: () -> Void
}
