//
//  TopRatedModel.swift
//  MovieSwiftUI
//
//  Created by Mohamed Makhlouf Ahmed on 16/01/2023.
//

import Foundation

struct TopRatedResponse: Codable {
    let results : [TopRatedMovies]
    let page: Int
    let totalPages, totalResults: Int
}

// MARK: - Result
struct TopRatedMovies: Codable , Identifiable {
    let id: Int
    let originalTitle, overview: String
    let posterPath, releaseDate, title: String
    var posterURL : URL? {
        URL(string: "https://image.tmdb.org/t/p/w400/\(posterPath)")
    }

   let voteAverage: Double
}

extension TopRatedMovies {
    static var mock: TopRatedMovies {
        TopRatedMovies(
            id: 507086,
            originalTitle: "Jurassic World Dominion",
            overview: "Four years after Isla Nublar was destroyed, dinosaurs now live—and hunt—alongside humans all over the world. This fragile balance will reshape the future and determine, once and for all, whether human beings are to remain the apex predators on a planet they now share with history’s most fearsome creatures.",
            posterPath: "/w4c0GTpmEQ1CZQNHndTv2PPgf2p.jpg", releaseDate: "2", title: "11", voteAverage: 11
        )
    }
}
