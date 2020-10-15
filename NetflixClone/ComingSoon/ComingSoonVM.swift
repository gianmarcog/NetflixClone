//
//  ComingSoonVM.swift
//  NetflixClone
//
//  Created by Gianmarco Giretti on 15.10.20.
//

import Foundation

class ComingSoonVM: ObservableObject {
    @Published var movies: [Movie] = []
    
    init() {
        self.movies = generateMovies(20)
    }
}
