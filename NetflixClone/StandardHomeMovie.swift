//
//  StandardHomeMovie.swift
//  NetflixClone
//
//  Created by Gianmarco Giretti on 10.09.20.
//

import SwiftUI
import KingfisherSwiftUI

struct StandardHomeMovie: View {
    var movie: Movie
    
    var body: some View {
        KFImage(movie.thumbnailURL)
            .resizable() //Größenveränderung. Wird vor dem Sklalieren-Objekt
            .scaledToFill()
    }
}

struct StandardHomeMovie_Previews: PreviewProvider {
    static var previews: some View {
        StandardHomeMovie(movie: exampleMovie1)
    }
}
