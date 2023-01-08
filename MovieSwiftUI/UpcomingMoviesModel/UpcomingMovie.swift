//
//  Movie.swift
//  MovieSwiftUI
//
//  Created by Mohamed Makhlouf Ahmed on 08/01/2023.
//

import Foundation

struct MovieResponse : Decodable{
    let results : [UpcomingMovie]
}

struct UpcomingMovie : Identifiable , Decodable {
    let id : Int
    let title : String
    let overview : String
    let posterPath : String
    var posterURL : URL? {
        URL(string: "https://image.tmdb.org/t/p/w400/\(posterPath)")
    }
}
