//
//  HomeView.swift
//  NetflixClone
//
//  Created by Gianmarco Giretti on 10.09.20.
//

import SwiftUI

struct HomeView: View {
    var vm = HomeVM()
    
    // Gibt die Grenzen des iOS-Geräts zurück
    let screen = UIScreen.main.bounds
    
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            // mai VStack
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    
                    // Anzeige von TopMoviePreview für die View
                    TopMoviePreview(movie: exampleMovie3)
                        .frame(width: screen.width)
                        .padding(.top, -110)
                    
                    // Alle Kategorien werden gelistet
                    ForEach(vm.allCategories, id: \.self) { category in
                        //Alle Kategorien werden nochmals in einem VStach sortiert
                        VStack {
                            HStack {
                                Text(category)
                                    .font(.title3)
                                    .bold()
                                Spacer()
                            }
                            
                            // Damit Filme einer Kategorie horizontal gewischt werden können
                            ScrollView(.horizontal, showsIndicators: false){
                                LazyHStack {
                                    ForEach(vm.getMovie(forCat: category)) {
                                        movie in
                                        StandardHomeMovie(movie: movie)
                                            .frame(width: 100, height: 200)
                                            .padding(.horizontal, 30)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        .foregroundColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
