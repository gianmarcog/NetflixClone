//
//  MoviePreviewCell.swift
//  NetflixClone
//
//  Created by Gianmarco Giretti on 08.11.20.
//

import SwiftUI
import KingfisherSwiftUI

struct MoviePreviewCell: View {
    
    var movie: Movie
    
    let colors: [Color] = [.yellow, .gray,  .pink, .orange, .red, .blue, .purple]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            KFImage(movie.thumbnailURL)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .overlay(
                Circle()
                    .stroke(lineWidth: 2.0)
                    .foregroundColor(colors.randomElement())
            )
            
            Image(movie.previewImageName)
                .resizable()
                .scaledToFit()
                .offset(y: -20)
                .frame(height: 60)
        }
    }
}

struct MoviePreviewCell_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            MoviePreviewCell(movie: exampleMovie2)
                .frame(width: 160, height: 50)
        }
    }
}
