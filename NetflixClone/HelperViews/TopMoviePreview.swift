//
//  TopMoviePreview.swift
//  NetflixClone
//
//  Created by Gianmarco Giretti on 14.09.20.
//

import SwiftUI
import KingfisherSwiftUI

struct TopMoviePreview: View {
    var movie: Movie
    
    // Funktion die dafür sorgt, dass nach dem letzten Text kein Kreis kommt
    func isCategoryLast(_ cat: String) -> Bool {
        let catCount = movie.categories.count
        
        if let index = movie.categories.firstIndex(of: cat){
            if index + 1  != catCount {
                return false
            }
        }
        return true
    }
    
    var body: some View {
        ZStack {
            KFImage(movie.thumbnailURL)
                .resizable()
                .scaledToFill()
                .clipped()
            
            VStack {
                Spacer()
                
                HStack {
                    // Alle Kategorien werden durchgegangen
                    ForEach(movie.categories, id: \.self) { category in

                        HStack {
                            Text(category).font(.footnote)
                            
                            if !isCategoryLast(category) {
                                
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 3))
                                
                            }
                        }
                    }
                }.padding(.bottom,10)
                HStack {
                    Spacer()
                    
                    SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: true, action: {
                        //
                    })
                    
                    Spacer()
                    
                    WhiteButton(text: "play", imageName: "play.fill"){
                        //
                    }
                    .frame(width: 120)
                    
                    Spacer()
                    
                    SmallVerticalButton(text: "Info", isOnImage: "info.circle", isOffImage: "info.circle", isOn: true, action: {
                        //
                    })
                    Spacer()
                }
            }
            // Ist für die Trübung Bilder zuständig
            .background(
                LinearGradient
.blackOpacityGradient
                    .padding(.top, 350)
                )
        }
        .foregroundColor(.white)
    }
}

struct TopMoviePreview_Previews: PreviewProvider {
    static var previews: some View {
        TopMoviePreview(movie: exampleMovie3)
    }
}
