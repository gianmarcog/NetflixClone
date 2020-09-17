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
    
    //Moviel Detsil View
    var year: Int
    var rating: String
    var numberOfSeasons: Int?
    
    var episodes: [Episode]?
    
    var promotionHeadline: String?
    
    var numberOfSeasonsDisplay: String {
        if let num = numberOfSeasons {
            if num == 1 {
                return "1 Season"
            } else {
                return "\(num) seasons"
            }
        }
        return ""
    }
}
