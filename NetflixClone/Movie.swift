//
//  Movie.swift
//  NetflixClone
//
//  Created by Gianmarco Giretti on 10.09.20.
//

import Foundation

// Model - Objects | Werden die Parameter des Movie-Model festgelegt
struct Movie: Identifiable {
    var id: String
    var name: String
    var thumbnailURL: URL
    var categories: [String]
}
