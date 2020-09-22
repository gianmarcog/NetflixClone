//
//  HomeVM.swift
//  NetflixClone
//
//  Created by Gianmarco Giretti on 13.09.20.
//

import Foundation

// Das ViewModel fungiert als Verbindungsglied zwischen dem Model (Movie.swift) und den Views.

class HomeVM: ObservableObject {
    
    // String == Category | Veröffentlicht ein Dictionary, auf welches andere Klassen auf die Movie-Daten zugreifen können
    @Published var movies: [String: [Movie]] = [:]
    
    // Alle Keys des Dictionary werden durch map in Strings umgewandelt. Zurückgegeben wird dann ein Array von Strings
    public var allCategories: [String] {
        return movies.keys.map({ String($0) })
    }
    // Wird aufgerrufen, wenn der übergebene String-Wert sich im [Movie]-Array befindet
    public func getMovie(forCat cat: String, andHomeRow homeRow: HomeTopRow) -> [Movie] {
        
        switch homeRow {
        case .home:
            return movies[cat] ?? []
        case .movies:
            return (movies[cat] ?? []).filter({ $0.movieType == .movie})
        case .tvShows:
            return (movies[cat] ?? []).filter({ $0.movieType == .tvShow})
        case .myList:
            return movies[cat] ?? []
        }
    }
    
    init() {
        setupMovies()
    }
    
    // Stellt die unterschiedlichen Views der Startseite da
    func setupMovies() {
        movies["Trending Now"] = exampleMovies
        movies["Stand-Up Comedy"] = exampleMovies.shuffled()
        movies["New Release"] = exampleMovies.shuffled()
        movies["Watch It again"] = exampleMovies.shuffled()
        movies["Sci-Fi Movies"] = exampleMovies.shuffled()
    }
    
}
