//
//  MoviePreviewRow.swift
//  NetflixClone
//
//  Created by Gianmarco Giretti on 08.11.20.
//

import SwiftUI

struct MoviePreviewRow: View {
    
    var movies: [Movie]
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Previews")
                .font(.title3)
                .bold()
                .foregroundColor(.white)
                .padding(.leading, 6)
            
            ScrollView(.horizontal, showsIndicators: false, content: {
                LazyHStack {
                    ForEach(0..<movies.count) { movieIndex in
                        let movie = movies[movieIndex]
                        
                        MoviePreviewCell(movie: movie)
                            .frame(width: 100, height: 100)
                            .padding(.trailing, 14)
                            .padding(.leading, 6)
                        
                    }
                }
            })
        }
        .frame(height: 150)
    }
}

struct MoviePreviewRow_Previews: PreviewProvider {
    static var previews: some View {
        MoviePreviewRow(movies: exampleMovies)
    }
}
