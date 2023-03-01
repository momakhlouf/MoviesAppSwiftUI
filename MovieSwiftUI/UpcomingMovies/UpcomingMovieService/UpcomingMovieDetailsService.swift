//
//  UpcomingMovieDetailsService.swift
//  MovieSwiftUI
//
//  Created by Mohamed Makhlouf Ahmed on 10/01/2023.
//

import Foundation
class UpcomingDetailsService {
    func getDetails(of movie : UpcomingMovie) async throws -> [MovieCastMember]{
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(movie.id)/credits?api_key=15fe946886608e9b2315244355fb5b94")!
        let (data,_) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
       // decoder.keyDecodingStrategy = .convertFromSnakeCase
        let decodedData = try decoder.decode(UpcomingMovieDetailsModel.self, from: data)
        return decodedData.cast
       
    }
}



