//
//  PreviewVM.swift
//  NetflixClone
//
//  Created by Gianmarco Giretti on 22.11.20.
//

import Foundation

class PreviewVM: ObservableObject {
    
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
}
