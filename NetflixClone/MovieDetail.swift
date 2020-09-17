//
//  MovieDetail.swift
//  NetflixClone
//
//  Created by Gianmarco Giretti on 16.09.20.
//

import SwiftUI

struct MovieDetail: View {
    var movie: Movie
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        //
                    }, label: {
                        Image(systemName: "xmark.circle")
                            .font(.system(size: 28))
                    })
                }
                .padding(.horizontal, 22)
                
                ScrollView(.vertical, showsIndicators: false) {
                   
                    VStack  {
                        
                        StandardHomeMovie(movie: movie)
                            .frame(width: screen.width / 2.5)
                    }
                    
                    MovieInfoSubheadline(movie: movie)
                    
                    if movie.promotionHeadline != nil {
                        Text(movie.promotionHeadline! )
                            .bold()
                            .font(.headline)
                    }
                    
                }
            }
            .foregroundColor(.white)
        }
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: exampleMovie2)
    }
} 

struct MovieInfoSubheadline: View {
    var movie: Movie
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "hand.thumbsup.fill")
                .foregroundColor(.white)
            
            Text(String(movie.year))
            
            RatingView(rating: movie.rating)
            
            Text(movie.numberOfSeasonsDisplay)

        }
        .foregroundColor(.gray)
        .padding(.vertical, 6)
    }
}

struct RatingView: View {
    var rating: String
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
            
            Text(rating)
                .foregroundColor(.white)
                .font(.system(size: 12))
                .bold()
        }
        .frame(width: 50, height: 28)
    }
}